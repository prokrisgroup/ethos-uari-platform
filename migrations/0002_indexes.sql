-- ================================================================================
-- ETHOS UARI+ PLATFORM - INDEXES & PERFORMANCE OPTIMIZATION
-- ================================================================================
-- Created: December 18, 2025
-- Purpose: Indexes for optimal query performance across 187 questions & 29 industries
-- Platform: Cloudflare D1 (SQLite)
-- Based on: ETHOS INSTITUTE Technical Integration Specifications (API endpoints)
-- ================================================================================

-- ================================================================================
-- DOMAINS TABLE INDEXES
-- ================================================================================
CREATE INDEX IF NOT EXISTS idx_domains_short_code ON domains(short_code);
CREATE INDEX IF NOT EXISTS idx_domains_order ON domains(order_index);

-- ================================================================================
-- QUESTIONS TABLE INDEXES
-- Purpose: Optimize question lookups by domain, code, criticality
-- Use Case: API endpoint /api/questions/:domain fetches ~23 questions per domain
-- ================================================================================
CREATE INDEX IF NOT EXISTS idx_questions_domain ON questions(domain_id);
CREATE INDEX IF NOT EXISTS idx_questions_code ON questions(question_code);
CREATE INDEX IF NOT EXISTS idx_questions_criticality ON questions(criticality);
CREATE INDEX IF NOT EXISTS idx_questions_subdomain ON questions(subdomain);

-- Composite indexes for common query patterns
CREATE INDEX IF NOT EXISTS idx_questions_domain_subdomain ON questions(domain_id, subdomain);
CREATE INDEX IF NOT EXISTS idx_questions_domain_criticality ON questions(domain_id, criticality);

-- ================================================================================
-- INDUSTRIES TABLE INDEXES
-- Purpose: Optimize industry lookups and filtering
-- Use Case: Industry-specific benchmarking and recommendations
-- ================================================================================
CREATE INDEX IF NOT EXISTS idx_industries_short_code ON industries(short_code);
CREATE INDEX IF NOT EXISTS idx_industries_naics ON industries(naics_code);
CREATE INDEX IF NOT EXISTS idx_industries_ai_adoption ON industries(ai_adoption_rate);

-- ================================================================================
-- USERS TABLE INDEXES
-- Purpose: Optimize authentication and user management
-- Use Case: Login, role-based access, subscription management
-- ================================================================================
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_users_subscription ON users(subscription_tier);
CREATE INDEX IF NOT EXISTS idx_users_org ON users(organization_id);

-- Composite index for subscription queries
CREATE INDEX IF NOT EXISTS idx_users_subscription_expires ON users(subscription_tier, subscription_expires_at);

-- ================================================================================
-- ORGANIZATIONS TABLE INDEXES
-- Purpose: Optimize organization lookups and analytics
-- Use Case: Industry-based filtering, subscription revenue analysis
-- ================================================================================
CREATE INDEX IF NOT EXISTS idx_orgs_industry ON organizations(industry_id);
CREATE INDEX IF NOT EXISTS idx_orgs_subscription ON organizations(subscription_tier);
CREATE INDEX IF NOT EXISTS idx_orgs_size ON organizations(size);
CREATE INDEX IF NOT EXISTS idx_orgs_country ON organizations(country);

-- Composite index for revenue analytics
CREATE INDEX IF NOT EXISTS idx_orgs_subscription_mrr ON organizations(subscription_tier, mrr);

-- ================================================================================
-- ASSESSMENTS TABLE INDEXES
-- Purpose: Optimize assessment queries and reporting
-- Use Case: Dashboard analytics, progress tracking, report generation
-- ================================================================================
CREATE INDEX IF NOT EXISTS idx_assessments_org ON assessments(organization_id);
CREATE INDEX IF NOT EXISTS idx_assessments_assessor ON assessments(assessor_id);
CREATE INDEX IF NOT EXISTS idx_assessments_industry ON assessments(industry_id);
CREATE INDEX IF NOT EXISTS idx_assessments_status ON assessments(status);
CREATE INDEX IF NOT EXISTS idx_assessments_type ON assessments(assessment_type);

-- Composite indexes for common query patterns
CREATE INDEX IF NOT EXISTS idx_assessments_org_status ON assessments(organization_id, status);
CREATE INDEX IF NOT EXISTS idx_assessments_industry_completed ON assessments(industry_id, completed_at);
CREATE INDEX IF NOT EXISTS idx_assessments_completed_at ON assessments(completed_at DESC);

-- Performance analytics
CREATE INDEX IF NOT EXISTS idx_assessments_maturity ON assessments(maturity_level);
CREATE INDEX IF NOT EXISTS idx_assessments_percentile ON assessments(percentile_rank);

-- ================================================================================
-- RESPONSES TABLE INDEXES
-- Purpose: Optimize response queries and scoring calculations
-- Use Case: Real-time scoring, evidence tracking, assessment completion status
-- ================================================================================
CREATE INDEX IF NOT EXISTS idx_responses_assessment ON responses(assessment_id);
CREATE INDEX IF NOT EXISTS idx_responses_question ON responses(question_id);

-- Composite indexes for scoring and analytics
CREATE INDEX IF NOT EXISTS idx_responses_assessment_question ON responses(assessment_id, question_id);
CREATE INDEX IF NOT EXISTS idx_responses_assessment_answered ON responses(assessment_id, answered_at);
CREATE INDEX IF NOT EXISTS idx_responses_score ON responses(response_score);

-- ================================================================================
-- REPORTS TABLE INDEXES
-- Purpose: Optimize report retrieval and management
-- Use Case: Report generation, versioning, PDF delivery
-- ================================================================================
CREATE INDEX IF NOT EXISTS idx_reports_assessment ON reports(assessment_id);
CREATE INDEX IF NOT EXISTS idx_reports_generated ON reports(generated_at DESC);
CREATE INDEX IF NOT EXISTS idx_reports_version ON reports(report_version);

-- ================================================================================
-- PERFORMANCE NOTES
-- ================================================================================
-- 1. QUERY PERFORMANCE TARGETS (from your audit):
--    - Question lookup: <50ms
--    - Assessment scoring: <200ms  
--    - Report generation: <2s
--
-- 2. EXPECTED DATA VOLUME (Year 1 projections from your audit):
--    - Questions: 187 (static)
--    - Industries: 29 (static)
--    - Organizations: 500-1,000
--    - Assessments: 2,000-5,000
--    - Responses: 374,000-935,000 (187 questions × 2,000-5,000 assessments)
--
-- 3. INDEX STRATEGY:
--    - Single-column indexes: Fast lookups for foreign keys and filters
--    - Composite indexes: Optimized for common multi-column queries
--    - Descending indexes: Efficient for "latest" queries (e.g., recent assessments)
--
-- ================================================================================
-- END OF INDEXES
-- ================================================================================
-- Next: Apply migrations locally using `wrangler d1 migrations apply --local`
-- Total Indexes: 35 (optimized for 187-question system performance)
-- ================================================================================
