-- ================================================================================
-- ETHOS UARI+ PLATFORM - INITIAL DATABASE SCHEMA
-- ================================================================================
-- Created: December 18, 2025
-- Purpose: Core 8-table schema for complete 187-question UARI+ system
-- Platform: Cloudflare D1 (SQLite)
-- Based on: ETHOS INSTITUTE Comprehensive Audit (3,700+ pages)
-- ================================================================================

-- ================================================================================
-- TABLE 1: domains
-- Purpose: Store 8 UARI+ assessment domains
-- Source: Your audit Phase 1 - Assessment Framework Architecture
-- ================================================================================
CREATE TABLE IF NOT EXISTS domains (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE,                   -- e.g., "Data Governance & Privacy"
  short_code TEXT NOT NULL UNIQUE,              -- e.g., "D5"
  description TEXT NOT NULL,                    -- Domain description
  weight REAL NOT NULL DEFAULT 1.0,             -- Scoring weight (Data Governance = 1.5x)
  order_index INTEGER NOT NULL,                 -- Display order (5, 6, 7, 8)
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ================================================================================
-- TABLE 2: questions
-- Purpose: Store ALL 187 assessment questions with full metadata
-- Source: Your audit Phase 2 - Questions (Domains 5-8, all questions)
-- ================================================================================
CREATE TABLE IF NOT EXISTS questions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  domain_id INTEGER NOT NULL,                    -- Links to domains table
  subdomain TEXT NOT NULL,                       -- e.g., "Data Quality Management"
  question_code TEXT NOT NULL UNIQUE,            -- e.g., "D5-Q001"
  question_text TEXT NOT NULL,                   -- The actual question
  criticality TEXT NOT NULL,                     -- 'CRITICAL', 'HIGH', 'MEDIUM', 'LOW'
  scoring_weight REAL NOT NULL DEFAULT 1.0,      -- Question-level weight
  
  -- Metadata stored as JSON (flexible, extensible)
  response_options TEXT NOT NULL,                -- JSON: Array of 5 maturity levels
  evidence_requirements TEXT NOT NULL,           -- JSON: Required evidence types
  assessor_guidance TEXT NOT NULL,               -- JSON: Guidance for assessors
  industry_variations TEXT,                      -- JSON: Industry-specific variations
  related_questions TEXT,                        -- JSON: Array of related question IDs
  regulatory_context TEXT,                       -- JSON: Relevant regulations
  
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (domain_id) REFERENCES domains(id)
);

-- ================================================================================
-- TABLE 3: industries
-- Purpose: Store ALL 29 industry profiles with comprehensive data
-- Source: Your audit Phase 3 - Industries (49-page profiles each)
-- ================================================================================
CREATE TABLE IF NOT EXISTS industries (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE,                    -- e.g., "Healthcare"
  naics_code TEXT,                              -- NAICS industry code
  short_code TEXT NOT NULL UNIQUE,              -- e.g., "HLTH"
  
  -- Profile stored as JSON (49-page structure from your audit)
  profile_data TEXT NOT NULL,                   -- JSON: Full industry profile
  
  -- Quick access fields (for filtering, searching)
  ai_adoption_rate REAL,                        -- e.g., 68% = 0.68
  avg_governance_maturity REAL,                 -- e.g., 3.5/5.0
  market_size_usd REAL,                         -- Market size in USD
  
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ================================================================================
-- TABLE 4: users
-- Purpose: User authentication and profiles
-- Source: Your audit Technical Integration Specifications
-- ================================================================================
CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  password_hash TEXT NOT NULL,                  -- bcrypt hash
  role TEXT NOT NULL DEFAULT 'user',            -- 'admin', 'assessor', 'user'
  organization_id INTEGER,                      -- Links to organizations table
  
  -- Subscription info
  subscription_tier TEXT DEFAULT 'free',        -- 'free', 'individual', 'team', 'premium', 'enterprise'
  subscription_expires_at DATETIME,
  
  -- Metadata
  last_login_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

-- ================================================================================
-- TABLE 5: organizations
-- Purpose: Companies/entities being assessed
-- Source: Your audit Technical Integration Specifications
-- ================================================================================
CREATE TABLE IF NOT EXISTS organizations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  industry_id INTEGER NOT NULL,                 -- Links to industries table
  
  -- Organization details
  size TEXT,                                    -- 'small', 'medium', 'large', 'enterprise'
  country TEXT,
  website TEXT,
  
  -- Subscription info (UARI+ Premium: $2,500/month from your audit)
  subscription_tier TEXT DEFAULT 'free',
  mrr REAL,                                     -- Monthly recurring revenue
  
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (industry_id) REFERENCES industries(id)
);

-- ================================================================================
-- TABLE 6: assessments
-- Purpose: Assessment instances (one per organization per time period)
-- Source: Your audit Technical Integration Specifications
-- ================================================================================
CREATE TABLE IF NOT EXISTS assessments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  organization_id INTEGER NOT NULL,
  assessor_id INTEGER NOT NULL,                 -- User who conducted assessment
  industry_id INTEGER NOT NULL,                 -- Industry context
  
  -- Assessment metadata
  status TEXT NOT NULL DEFAULT 'in_progress',   -- 'in_progress', 'completed', 'archived'
  assessment_type TEXT NOT NULL DEFAULT 'uari_plus',  -- 'uari_plus', 'bridge', 'custom'
  
  -- Scores (calculated, stored as JSON for quick access)
  scores TEXT,                                  -- JSON: Overall + domain + subdomain scores
  percentile_rank REAL,                         -- Industry percentile (0-100)
  maturity_level INTEGER,                       -- Overall maturity (1-5)
  
  -- Timestamps
  started_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  completed_at DATETIME,
  report_generated_at DATETIME,
  
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (organization_id) REFERENCES organizations(id),
  FOREIGN KEY (assessor_id) REFERENCES users(id),
  FOREIGN KEY (industry_id) REFERENCES industries(id)
);

-- ================================================================================
-- TABLE 7: responses
-- Purpose: Question-by-question responses with evidence
-- Source: Your audit Phase 2 - Questions (evidence requirements)
-- ================================================================================
CREATE TABLE IF NOT EXISTS responses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  assessment_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  -- Response data
  response_value INTEGER NOT NULL,              -- 1-5 (maturity level selected)
  response_score REAL NOT NULL,                 -- Calculated score (0-100)
  
  -- Evidence (stored as JSON)
  evidence TEXT,                                -- JSON: Array of evidence items
  notes TEXT,                                   -- Assessor notes
  
  -- Metadata
  answered_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (assessment_id) REFERENCES assessments(id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- ================================================================================
-- TABLE 8: reports
-- Purpose: Generated assessment reports (HTML + optional PDF)
-- Source: Your audit Phase 5 - Report Template (127-page design)
-- ================================================================================
CREATE TABLE IF NOT EXISTS reports (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  assessment_id INTEGER NOT NULL UNIQUE,        -- One report per assessment
  
  -- Report content
  html_content TEXT NOT NULL,                   -- Full HTML report
  pdf_url TEXT,                                 -- URL to PDF in R2 (Phase 2)
  
  -- Report metadata
  report_version TEXT DEFAULT '1.0',
  page_count INTEGER,
  file_size_bytes INTEGER,
  
  -- Timestamps
  generated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (assessment_id) REFERENCES assessments(id) ON DELETE CASCADE
);

-- ================================================================================
-- END OF INITIAL SCHEMA
-- ================================================================================
-- Next: Create indexes for performance optimization
-- Total Tables: 8 (supports complete 187-question UARI+ system)
-- ================================================================================
