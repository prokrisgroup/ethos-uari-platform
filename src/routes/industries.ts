/**
 * Industries API Routes
 * GET /api/industries - List all 29 industries
 * GET /api/industries/:id - Get specific industry profile
 * GET /api/industries/code/:code - Get industry by short code
 */

import { Hono } from 'hono'
import type { Bindings, Industry, ApiResponse } from '../types'

const industries = new Hono<{ Bindings: Bindings }>()

// Helper: Parse JSON profile_data field
function parseIndustry(raw: any): Industry {
  return {
    ...raw,
    profile_data: typeof raw.profile_data === 'string' ? JSON.parse(raw.profile_data) : raw.profile_data
  }
}

// GET /api/industries - List all industries
industries.get('/', async (c) => {
  try {
    const { DB } = c.env

    // Get all industries ordered by AI adoption rate (highest first)
    const result = await DB.prepare(`
      SELECT * FROM industries
      ORDER BY ai_adoption_rate DESC, name ASC
    `).all()

    const rawIndustries = result.results as any[]
    const parsedIndustries: Industry[] = rawIndustries.map(parseIndustry)

    const response: ApiResponse<Industry[]> = {
      success: true,
      data: parsedIndustries,
      message: `Retrieved ${parsedIndustries.length} industries`
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch industries'
    }
    return c.json(response, 500)
  }
})

// GET /api/industries/:id - Get specific industry by ID
industries.get('/:id', async (c) => {
  try {
    const { DB } = c.env
    const industryId = parseInt(c.req.param('id'))

    if (isNaN(industryId)) {
      const response: ApiResponse<null> = {
        success: false,
        error: 'Invalid industry ID'
      }
      return c.json(response, 400)
    }

    const result = await DB.prepare(`
      SELECT * FROM industries
      WHERE id = ?
    `).bind(industryId).first()

    if (!result) {
      const response: ApiResponse<null> = {
        success: false,
        error: `Industry ${industryId} not found`
      }
      return c.json(response, 404)
    }

    const industry = parseIndustry(result)

    const response: ApiResponse<Industry> = {
      success: true,
      data: industry
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch industry'
    }
    return c.json(response, 500)
  }
})

// GET /api/industries/code/:code - Get industry by short code (e.g., HC, FS, TECH)
industries.get('/code/:code', async (c) => {
  try {
    const { DB } = c.env
    const industryCode = c.req.param('code').toUpperCase()

    const result = await DB.prepare(`
      SELECT * FROM industries
      WHERE short_code = ?
    `).bind(industryCode).first()

    if (!result) {
      const response: ApiResponse<null> = {
        success: false,
        error: `Industry with code ${industryCode} not found`
      }
      return c.json(response, 404)
    }

    const industry = parseIndustry(result)

    const response: ApiResponse<Industry> = {
      success: true,
      data: industry
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch industry'
    }
    return c.json(response, 500)
  }
})

// GET /api/industries/stats/overview - Industry statistics overview
industries.get('/stats/overview', async (c) => {
  try {
    const { DB } = c.env

    const stats = await DB.prepare(`
      SELECT 
        COUNT(*) as total_industries,
        AVG(ai_adoption_rate) as avg_adoption_rate,
        AVG(avg_governance_maturity) as avg_governance_maturity,
        MAX(ai_adoption_rate) as max_adoption_rate,
        MIN(ai_adoption_rate) as min_adoption_rate,
        MAX(avg_governance_maturity) as max_governance_maturity,
        MIN(avg_governance_maturity) as min_governance_maturity
      FROM industries
    `).first()

    const response: ApiResponse<typeof stats> = {
      success: true,
      data: stats,
      message: 'Industry statistics retrieved successfully'
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch statistics'
    }
    return c.json(response, 500)
  }
})

export default industries
