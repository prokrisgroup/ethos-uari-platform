-- ================================================================================
-- ETHOS UARI+ PLATFORM - DOMAINS SEED DATA
-- ================================================================================
-- Created: December 18, 2025
-- Purpose: Insert 8 UARI+ Assessment Domains
-- Source: PHASE1_ASSESSMENT_FRAMEWORK_ARCHITECTURE.md (Your Audit)
-- Total Questions: 187 across 8 domains
-- ================================================================================

-- ================================================================================
-- DOMAIN 1: Ethical Leadership & Governance (20 questions, 10.7%)
-- ================================================================================
INSERT INTO domains (id, name, short_code, description, weight, order_index) VALUES (
  1,
  'Ethical Leadership & Governance',
  'D1',
  'Establishes governance structures, ethical oversight, stakeholder engagement, and comprehensive policy frameworks for AI systems. Focuses on governance structure & accountability, ethics oversight & governance, stakeholder engagement, and policy frameworks.',
  1.0,
  1
);

-- ================================================================================
-- DOMAIN 2: Purpose-Driven Innovation (25 questions, 13.4%)
-- ================================================================================
INSERT INTO domains (id, name, short_code, description, weight, order_index) VALUES (
  2,
  'Purpose-Driven Innovation',
  'D2',
  'Ensures AI innovation aligns with organizational values and social benefit. Covers value alignment, innovation ethics, responsible experimentation, and impact assessment to drive meaningful innovation.',
  1.0,
  2
);

-- ================================================================================
-- DOMAIN 3: Human-Centricity & Agency (22 questions, 11.8%)
-- ================================================================================
INSERT INTO domains (id, name, short_code, description, weight, order_index) VALUES (
  3,
  'Human-Centricity & Agency',
  'D3',
  'Preserves human autonomy, ensures human-in-the-loop systems, maintains user control & consent, and promotes accessibility & inclusion. Keeps humans at the center of AI decision-making.',
  1.0,
  3
);

-- ================================================================================
-- DOMAIN 4: Safety, Robustness & Reliability (20 questions, 10.7%)
-- ================================================================================
INSERT INTO domains (id, name, short_code, description, weight, order_index) VALUES (
  4,
  'Safety, Robustness & Reliability',
  'D4',
  'Ensures system safety protocols, rigorous robustness testing, comprehensive failure mode analysis, and effective incident response. Focuses on building reliable and safe AI systems.',
  1.0,
  4
);

-- ================================================================================
-- DOMAIN 5: Data Governance & Privacy (40 questions, 21.4%)
-- ================================================================================
INSERT INTO domains (id, name, short_code, description, weight, order_index) VALUES (
  5,
  'Data Governance & Privacy',
  'D5',
  'Comprehensive data governance policies, privacy protection mechanisms, complete data lifecycle management, and cross-border data flow compliance. Critical domain for data-driven AI systems.',
  1.0,
  5
);

-- ================================================================================
-- DOMAIN 6: Transparency & Explainability (40 questions, 21.4%)
-- ================================================================================
INSERT INTO domains (id, name, short_code, description, weight, order_index) VALUES (
  6,
  'Transparency & Explainability',
  'D6',
  'Algorithmic transparency, robust explainability mechanisms, comprehensive documentation standards, and contestability processes. Ensures AI systems can be understood and challenged.',
  1.0,
  6
);

-- ================================================================================
-- DOMAIN 7: Social Impact & Global Equity (40 questions, 21.4%)
-- ================================================================================
INSERT INTO domains (id, name, short_code, description, weight, order_index) VALUES (
  7,
  'Social Impact & Global Equity',
  'D7',
  'Advanced bias detection & mitigation, rigorous fairness assessment, equity considerations across demographics, and global accessibility standards. Ensures AI benefits all populations fairly.',
  1.0,
  7
);

-- ================================================================================
-- DOMAIN 8: Environmental Sustainability (40 questions, 21.4%)
-- ================================================================================
INSERT INTO domains (id, name, short_code, description, weight, order_index) VALUES (
  8,
  'Environmental Sustainability',
  'D8',
  'Carbon footprint measurement and reduction, energy efficiency optimization, resource optimization strategies, and comprehensive environmental impact assessment. Sustainable AI development.',
  1.0,
  8
);

-- ================================================================================
-- VERIFICATION QUERY
-- ================================================================================
-- Run this to verify domains were inserted correctly:
-- SELECT COUNT(*) as total_domains, SUM(CASE WHEN weight = 1.0 THEN 1 ELSE 0 END) as weighted_domains FROM domains;
-- Expected: 8 domains, all with weight 1.0

-- ================================================================================
-- DOMAIN DISTRIBUTION SUMMARY
-- ================================================================================
-- Domain 1 (D1): 20 questions (10.7%) - Ethical Leadership & Governance
-- Domain 2 (D2): 25 questions (13.4%) - Purpose-Driven Innovation
-- Domain 3 (D3): 22 questions (11.8%) - Human-Centricity & Agency
-- Domain 4 (D4): 20 questions (10.7%) - Safety, Robustness & Reliability
-- Domain 5 (D5): 40 questions (21.4%) - Data Governance & Privacy
-- Domain 6 (D6): 40 questions (21.4%) - Transparency & Explainability
-- Domain 7 (D7): 40 questions (21.4%) - Social Impact & Global Equity
-- Domain 8 (D8): 40 questions (21.4%) - Environmental Sustainability
-- ================================================================================
-- TOTAL: 187 questions (100%)
-- ================================================================================
