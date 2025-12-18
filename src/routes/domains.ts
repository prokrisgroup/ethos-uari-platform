/**
 * Domain API Routes
 * GET /api/domains - List all 8 assessment domains
 * GET /api/domains/:id - Get specific domain with question count
 */

import { Hono } from 'hono'
import type { Bindings, Domain, DomainWithQuestionCount, ApiResponse } from '../types'

const domains = new Hono<{ Bindings: Bindings }>()

// GET /api/domains - List all domains
domains.get('/', async (c) => {
  try {
    const { DB } = c.env

    // Get all domains with question counts
    const result = await DB.prepare(`
      SELECT 
        d.*,
        COUNT(q.id) as question_count
      FROM domains d
      LEFT JOIN questions q ON d.id = q.domain_id
      GROUP BY d.id
      ORDER BY d.order_index
    `).all()

    const domains: DomainWithQuestionCount[] = result.results as any[]

    const response: ApiResponse<DomainWithQuestionCount[]> = {
      success: true,
      data: domains,
      message: `Retrieved ${domains.length} domains`
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch domains'
    }
    return c.json(response, 500)
  }
})

// GET /api/domains/:id - Get specific domain
domains.get('/:id', async (c) => {
  try {
    const { DB } = c.env
    const domainId = parseInt(c.req.param('id'))

    if (isNaN(domainId) || domainId < 1 || domainId > 8) {
      const response: ApiResponse<null> = {
        success: false,
        error: 'Invalid domain ID. Must be 1-8'
      }
      return c.json(response, 400)
    }

    // Get domain with question count
    const result = await DB.prepare(`
      SELECT 
        d.*,
        COUNT(q.id) as question_count
      FROM domains d
      LEFT JOIN questions q ON d.id = q.domain_id
      WHERE d.id = ?
      GROUP BY d.id
    `).bind(domainId).first()

    if (!result) {
      const response: ApiResponse<null> = {
        success: false,
        error: `Domain ${domainId} not found`
      }
      return c.json(response, 404)
    }

    const response: ApiResponse<DomainWithQuestionCount> = {
      success: true,
      data: result as DomainWithQuestionCount
    }

    return c.json(response)
  } catch (error) {
    const response: ApiResponse<null> = {
      success: false,
      error: error instanceof Error ? error.message : 'Failed to fetch domain'
    }
    return c.json(response, 500)
  }
})

export default domains
