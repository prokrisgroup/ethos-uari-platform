/**
 * Assessment API Routes
 * POST /api/assessments - Create new assessment
 * GET /api/assessments/:id - Get assessment details
 * GET /api/assessments/organization/:orgId - List assessments for organization
 * PUT /api/assessments/:id/responses - Submit question responses
 * POST /api/assessments/:id/calculate - Calculate assessment score
 */

import { Hono } from 'hono'
import type { 
  Bindings, 
  Assessment, 
  AssessmentWithDetails,
  Response as ResponseType,
  ApiResponse 
} from '../types'

const assessments = new Hono<{ Bindings: Bindings }>()

// POST /api/assessments - Create new assessment
assessments.post('/', async (c) => {
  try {
    const { DB } = c.env
    const body = await c.req.json()

    const { organization_id, industry_id, assessment_name, assessment_type } = body

    // Validate required fields
    if (!organization_id || !assessment_name) {
      const response: ApiResponse<null> = {
        success: false,
        error: 'Missing required fields: organization_id, assessment_name'
      }
      return c.json(response, 400)
    }

    // Create assessment
    const result = await DB.prepare(`
      INSERT INTO assessments (
        organization_id,
        industry_id,
        assessment_name,
        assessment_type,
        status,
        created_at,
        updated_at
      ) VALUES (?, ?, ?, ?, 'draft', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
    `).bind(
      organization_id,
      industry_id || null,
      assessment_name,
      assessment_type || 'full'
    ).run()

    const assessmentId = result.meta.last_row_id

    const response: ApiResponse<{ id: number }> = {
      success: true,
      data: { id: assessmentId },
      message: 'Assessment created successfully'
    }

    return c.json(response, 201)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to create assessment'
    }
    return c.json(response, 500)
  }
})

// GET /api/assessments/:id - Get assessment with all responses
assessments.get('/:id', async (c) => {
  try {
    const { DB } = c.env
    const assessmentId = parseInt(c.req.param('id'))

    if (isNaN(assessmentId)) {
      const response: ApiResponse<null> = {
        success: false,
        error: 'Invalid assessment ID'
      }
      return c.json(response, 400)
    }

    // Get assessment details
    const assessment = await DB.prepare(`
      SELECT 
        a.*,
        o.organization_name,
        o.industry as org_industry,
        i.industry_name,
        COUNT(DISTINCT r.id) as completed_responses,
        (SELECT COUNT(*) FROM questions) as total_questions
      FROM assessments a
      LEFT JOIN organizations o ON a.organization_id = o.id
      LEFT JOIN industries i ON a.industry_id = i.id
      LEFT JOIN responses r ON a.id = r.assessment_id
      WHERE a.id = ?
      GROUP BY a.id
    `).bind(assessmentId).first()

    if (!assessment) {
      const response: ApiResponse<null> = {
        success: false,
        error: `Assessment ${assessmentId} not found`
      }
      return c.json(response, 404)
    }

    // Get all responses for this assessment
    const responsesResult = await DB.prepare(`
      SELECT r.*, q.question_code, q.question_text
      FROM responses r
      JOIN questions q ON r.question_id = q.id
      WHERE r.assessment_id = ?
      ORDER BY q.question_code
    `).bind(assessmentId).all()

    const assessmentWithDetails: AssessmentWithDetails = {
      ...assessment as any,
      responses: responsesResult.results as any[]
    }

    const response: ApiResponse<AssessmentWithDetails> = {
      success: true,
      data: assessmentWithDetails
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch assessment'
    }
    return c.json(response, 500)
  }
})

// PUT /api/assessments/:id/responses - Submit or update question responses
assessments.put('/:id/responses', async (c) => {
  try {
    const { DB } = c.env
    const assessmentId = parseInt(c.req.param('id'))
    const body = await c.req.json()

    const { question_id, response_value, response_text, evidence_urls, assessor_notes } = body

    if (!question_id || response_value === undefined) {
      const response: ApiResponse<null> = {
        success: false,
        error: 'Missing required fields: question_id, response_value'
      }
      return c.json(response, 400)
    }

    // Check if response already exists
    const existing = await DB.prepare(`
      SELECT id FROM responses
      WHERE assessment_id = ? AND question_id = ?
    `).bind(assessmentId, question_id).first()

    if (existing) {
      // Update existing response
      await DB.prepare(`
        UPDATE responses
        SET response_value = ?,
            response_text = ?,
            evidence_urls = ?,
            assessor_notes = ?,
            updated_at = CURRENT_TIMESTAMP
        WHERE assessment_id = ? AND question_id = ?
      `).bind(
        response_value,
        response_text || null,
        evidence_urls || null,
        assessor_notes || null,
        assessmentId,
        question_id
      ).run()
    } else {
      // Insert new response
      await DB.prepare(`
        INSERT INTO responses (
          assessment_id,
          question_id,
          response_value,
          response_text,
          evidence_urls,
          assessor_notes,
          created_at,
          updated_at
        ) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
      `).bind(
        assessmentId,
        question_id,
        response_value,
        response_text || null,
        evidence_urls || null,
        assessor_notes || null
      ).run()
    }

    // Update assessment status and updated_at
    await DB.prepare(`
      UPDATE assessments
      SET updated_at = CURRENT_TIMESTAMP,
          status = CASE 
            WHEN (SELECT COUNT(*) FROM responses WHERE assessment_id = ?) >= 247 
            THEN 'completed'
            ELSE 'in_progress'
          END
      WHERE id = ?
    `).bind(assessmentId, assessmentId).run()

    const response: ApiResponse<{ success: boolean }> = {
      success: true,
      data: { success: true },
      message: 'Response saved successfully'
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to save response'
    }
    return c.json(response, 500)
  }
})

// POST /api/assessments/:id/calculate - Calculate final scores
assessments.post('/:id/calculate', async (c) => {
  try {
    const { DB } = c.env
    const assessmentId = parseInt(c.req.param('id'))

    // Get all responses with question details
    const responsesResult = await DB.prepare(`
      SELECT 
        r.response_value,
        q.domain_id,
        q.scoring_weight,
        q.criticality
      FROM responses r
      JOIN questions q ON r.question_id = q.id
      WHERE r.assessment_id = ?
    `).bind(assessmentId).all()

    const responses = responsesResult.results as any[]

    if (responses.length === 0) {
      const response: ApiResponse<null> = {
        success: false,
        error: 'No responses found for this assessment'
      }
      return c.json(response, 400)
    }

    // Calculate domain scores
    const domainScores: Record<number, { total: number; count: number; weighted: number }> = {}

    for (const resp of responses) {
      const domainId = resp.domain_id
      if (!domainScores[domainId]) {
        domainScores[domainId] = { total: 0, count: 0, weighted: 0 }
      }

      const weightedScore = resp.response_value * resp.scoring_weight
      domainScores[domainId].total += resp.response_value
      domainScores[domainId].weighted += weightedScore
      domainScores[domainId].count += 1
    }

    // Calculate overall score
    let totalWeighted = 0
    let totalQuestions = 0

    for (const [domainId, scores] of Object.entries(domainScores)) {
      totalWeighted += scores.weighted
      totalQuestions += scores.count
    }

    const overallScore = totalWeighted / totalQuestions
    const completionPercentage = (responses.length / 247) * 100

    // Update assessment with calculated scores
    await DB.prepare(`
      UPDATE assessments
      SET overall_score = ?,
          completion_percentage = ?,
          status = 'completed',
          completed_at = CURRENT_TIMESTAMP,
          updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `).bind(overallScore, completionPercentage, assessmentId).run()

    const response: ApiResponse<{ 
      overall_score: number
      completion_percentage: number
      domain_scores: typeof domainScores
    }> = {
      success: true,
      data: {
        overall_score: overallScore,
        completion_percentage: completionPercentage,
        domain_scores: domainScores
      },
      message: 'Assessment scores calculated successfully'
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to calculate scores'
    }
    return c.json(response, 500)
  }
})

// GET /api/assessments/organization/:orgId - List assessments for organization
assessments.get('/organization/:orgId', async (c) => {
  try {
    const { DB } = c.env
    const orgId = parseInt(c.req.param('orgId'))

    const result = await DB.prepare(`
      SELECT 
        a.*,
        o.organization_name,
        COUNT(DISTINCT r.id) as completed_responses
      FROM assessments a
      LEFT JOIN organizations o ON a.organization_id = o.id
      LEFT JOIN responses r ON a.id = r.assessment_id
      WHERE a.organization_id = ?
      GROUP BY a.id
      ORDER BY a.created_at DESC
    `).bind(orgId).all()

    const response: ApiResponse<Assessment[]> = {
      success: true,
      data: result.results as Assessment[],
      message: `Retrieved ${result.results.length} assessments`
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch assessments'
    }
    return c.json(response, 500)
  }
})

export default assessments
