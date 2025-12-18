/**
 * Question API Routes
 * GET /api/questions - List all questions (with filters)
 * GET /api/questions/:code - Get specific question by code
 * GET /api/questions/domain/:domainId - Get all questions for a domain
 */

import { Hono } from 'hono'
import type { Bindings, Question, QuestionRaw, ApiResponse } from '../types'

const questions = new Hono<{ Bindings: Bindings }>()

// Helper: Parse JSON fields from database
function parseQuestion(raw: QuestionRaw): Question {
  return {
    ...raw,
    response_options: JSON.parse(raw.response_options),
    evidence_requirements: JSON.parse(raw.evidence_requirements),
    assessor_guidance: JSON.parse(raw.assessor_guidance),
    industry_variations: raw.industry_variations ? JSON.parse(raw.industry_variations) : null,
    related_questions: raw.related_questions ? JSON.parse(raw.related_questions) : null,
    regulatory_context: raw.regulatory_context ? JSON.parse(raw.regulatory_context) : null
  }
}

// GET /api/questions/domain/:domainId - Get questions by domain
questions.get('/domain/:domainId', async (c) => {
  try {
    const { DB } = c.env
    const domainId = parseInt(c.req.param('domainId'))

    if (isNaN(domainId) || domainId < 1 || domainId > 8) {
      const response: ApiResponse<null> = {
        success: false,
        error: 'Invalid domain ID. Must be 1-8'
      }
      return c.json(response, 400)
    }

    const result = await DB.prepare(`
      SELECT * FROM questions
      WHERE domain_id = ?
      ORDER BY question_code
    `).bind(domainId).all()

    const rawQuestions = result.results as QuestionRaw[]
    const questions: Question[] = rawQuestions.map(parseQuestion)

    const response: ApiResponse<Question[]> = {
      success: true,
      data: questions,
      message: `Retrieved ${questions.length} questions for domain ${domainId}`
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch questions'
    }
    return c.json(response, 500)
  }
})

// GET /api/questions/:code - Get specific question by code (e.g., D1-Q001)
questions.get('/:code', async (c) => {
  try {
    const { DB } = c.env
    const questionCode = c.req.param('code').toUpperCase()

    // Validate format: D[1-8]-Q[001-999]
    const codePattern = /^D[1-8]-Q\d{3}$/
    if (!codePattern.test(questionCode)) {
      const response: ApiResponse<null> = {
        success: false,
        error: 'Invalid question code format. Expected: D1-Q001'
      }
      return c.json(response, 400)
    }

    const result = await DB.prepare(`
      SELECT * FROM questions
      WHERE question_code = ?
    `).bind(questionCode).first() as QuestionRaw | null

    if (!result) {
      const response: ApiResponse<null> = {
        success: false,
        error: `Question ${questionCode} not found`
      }
      return c.json(response, 404)
    }

    const question = parseQuestion(result)

    const response: ApiResponse<Question> = {
      success: true,
      data: question
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch question'
    }
    return c.json(response, 500)
  }
})

// GET /api/questions - List all questions (with optional filters)
questions.get('/', async (c) => {
  try {
    const { DB } = c.env
    
    // Query params for filtering
    const criticality = c.req.query('criticality')?.toUpperCase()
    const limit = parseInt(c.req.query('limit') || '50')
    const offset = parseInt(c.req.query('offset') || '0')

    let query = 'SELECT * FROM questions'
    const params: any[] = []

    if (criticality && ['CRITICAL', 'HIGH', 'MEDIUM', 'LOW'].includes(criticality)) {
      query += ' WHERE criticality = ?'
      params.push(criticality)
    }

    query += ' ORDER BY domain_id, question_code LIMIT ? OFFSET ?'
    params.push(limit, offset)

    const stmt = DB.prepare(query).bind(...params)
    const result = await stmt.all()

    const rawQuestions = result.results as QuestionRaw[]
    const questions: Question[] = rawQuestions.map(parseQuestion)

    const response: ApiResponse<Question[]> = {
      success: true,
      data: questions,
      message: `Retrieved ${questions.length} questions`
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch questions'
    }
    return c.json(response, 500)
  }
})

export default questions
