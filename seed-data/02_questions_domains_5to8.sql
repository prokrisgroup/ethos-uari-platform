-- ================================================================================
-- ETHOS UARI+ PLATFORM - QUESTIONS SEED DATA (DOMAINS 5-8)
-- ================================================================================
-- Created: December 18, 2025
-- Purpose: Insert 160 assessment questions for Domains 5-8
-- Source: Question Bank JSON files from comprehensive audit
-- Total: D5=40, D6=40, D7=40, D8=40 questions
-- ================================================================================

-- ================================================================================
-- DOMAIN 5: Data Governance & Privacy (40 questions)
-- ================================================================================

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Policy Framework',
  'D5-Q001',
  'Does your organization have a comprehensive data governance policy that specifically addresses AI systems?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No data governance policy exists", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic data governance policy in development, minimal AI coverage", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Data governance policy exists with some AI-specific provisions, inconsistently enforced", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive data governance policy with AI-specific sections, generally enforced", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive data governance policy with detailed AI provisions, fully enforced with regular audits", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide a copy of your data governance policy document, highlighting sections that specifically address AI systems. Include evidence of enforcement mechanisms such as audit reports, compliance tracking dashboards, or policy violation records."}',
  '{"guidance": "Review the policy for: 1) Comprehensiveness (covers all data lifecycle stages), 2) AI-specific provisions (training data, model data, inference data), 3) Enforcement mechanisms (monitoring, auditing, consequences), 4) Regular review and update processes, 5) Clear accountability structures. Check for evidence of actual enforcement, not just policy existence.", "maturity_indicators": {"level_1": "No formal policy exists; data governance is ad hoc and inconsistent", "level_2": "Policy is being drafted or in early stages; minimal AI-specific content", "level_3": "Policy exists and covers AI but enforcement is inconsistent; some gaps remain", "level_4": "Comprehensive policy with strong AI coverage; generally well-enforced", "level_5": "Industry-leading policy; comprehensive AI coverage; rigorous enforcement; regular audits"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Data Classification',
  'D5-Q002',
  'Are data classification frameworks in place that categorize AI training data, model data, and inference data?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No data classification framework exists", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic classification framework exists but does not cover AI-specific data types", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Classification framework includes some AI data categories but is incomplete", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive classification framework covers most AI data types", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive classification framework covers all AI data types with automated classification", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide your data classification framework document, showing categories for: 1) AI training data, 2) Model parameters and weights, 3) Inference/prediction data, 4) Feedback and retraining data. Include examples of classified datasets."}',
  '{"guidance": "Verify that the classification framework: 1) Includes AI-specific data categories, 2) Defines sensitivity levels, 3) Specifies handling requirements for each category, 4) Is actually applied to AI systems (check examples), 5) Includes automated classification tools where appropriate.", "maturity_indicators": {"level_1": "No classification; all data treated the same", "level_2": "Basic classification exists but AI data not specifically addressed", "level_3": "AI data categories defined but framework incomplete or inconsistently applied", "level_4": "Comprehensive AI data classification with good coverage and application", "level_5": "Complete AI data classification with automated tools and rigorous application"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Data Lifecycle',
  'D5-Q003',
  'Do you have documented data retention and deletion policies specifically for AI systems?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No retention or deletion policies exist", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "General retention policies exist but do not address AI-specific data", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "AI-specific retention policies exist but are incomplete or inconsistently applied", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive AI data retention and deletion policies with good enforcement", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive policies with automated retention management and deletion verification", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide retention and deletion policy documents covering: 1) Training data retention periods, 2) Model versioning and archival, 3) Inference data retention, 4) Deletion procedures and verification. Include evidence of policy enforcement such as deletion logs or retention schedules."}',
  '{"guidance": "Evaluate: 1) Policy comprehensiveness (covers all AI data types), 2) Retention periods are justified and documented, 3) Deletion procedures are secure and verifiable, 4) Compliance with regulations (GDPR right to erasure, etc.), 5) Automated enforcement where possible.", "maturity_indicators": {"level_1": "No retention policies; data kept indefinitely without justification", "level_2": "General retention policies but AI data not specifically addressed", "level_3": "AI retention policies exist but incomplete or inconsistently enforced", "level_4": "Comprehensive AI retention policies with good enforcement", "level_5": "Comprehensive policies with automated management and verification"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Privacy Assessment',
  'D5-Q004',
  'Are privacy impact assessments (PIAs) or data protection impact assessments (DPIAs) conducted for all AI systems processing personal data?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No PIAs/DPIAs are conducted", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "PIAs/DPIAs conducted occasionally for high-risk systems only", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "PIAs/DPIAs conducted for most AI systems but process is inconsistent", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "PIAs/DPIAs conducted for all AI systems processing personal data with standardized process", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive PIAs/DPIAs for all systems with continuous monitoring and regular updates", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide examples of completed PIAs/DPIAs for AI systems, including: 1) Assessment methodology, 2) Risk identification and mitigation, 3) Stakeholder consultation, 4) Approval and sign-off, 5) Monitoring and review procedures."}',
  '{"guidance": "Assess: 1) Coverage (all AI systems with personal data?), 2) Quality of assessments (thorough risk analysis?), 3) Stakeholder involvement, 4) Mitigation measures implemented, 5) Regular reviews and updates, 6) Integration with AI development lifecycle.", "maturity_indicators": {"level_1": "No privacy assessments conducted", "level_2": "Occasional assessments for obvious high-risk systems", "level_3": "Regular assessments but process needs standardization", "level_4": "Standardized assessments for all relevant systems", "level_5": "Comprehensive assessments with continuous monitoring"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Data Subject Rights',
  'D5-Q005',
  'Do you have mechanisms in place to honor data subject rights (access, rectification, erasure, portability) for data used in AI systems?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No mechanisms exist for data subject rights", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic mechanisms exist but AI systems are not included", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Mechanisms exist for AI systems but are manual and slow", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Efficient mechanisms in place for most data subject rights in AI systems", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Automated, efficient mechanisms for all data subject rights with full AI system coverage", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Data subject rights procedures documentation, 2) Examples of rights requests fulfilled for AI systems, 3) Response time metrics, 4) Technical implementation details (how data is located and removed from AI systems), 5) Verification procedures."}',
  '{"guidance": "Evaluate: 1) All rights covered (access, rectification, erasure, portability, objection), 2) AI systems specifically addressed, 3) Response times meet regulatory requirements, 4) Technical feasibility (can data actually be removed from models?), 5) Verification and documentation of actions taken.", "maturity_indicators": {"level_1": "No data subject rights mechanisms", "level_2": "Basic mechanisms but AI systems excluded", "level_3": "Mechanisms exist for AI but manual and inefficient", "level_4": "Efficient mechanisms with good AI coverage", "level_5": "Automated, comprehensive mechanisms for all rights"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Data Lifecycle Management',
  'D5-Q006',
  'Do you have documented procedures for obtaining informed consent when collecting data for AI training purposes?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No consent procedures exist for AI training data collection", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic consent obtained but not specifically for AI training purposes", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "AI-specific consent procedures exist but are inconsistently applied", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive informed consent procedures for AI training data, consistently applied", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading consent procedures with granular options, easy withdrawal, and continuous monitoring", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Consent forms or procedures used for AI training data collection, 2) Examples showing AI-specific language and disclosures, 3) Consent tracking and documentation systems, 4) Withdrawal procedures, 5) Evidence of consistent application across data collection activities."}',
  '{"guidance": "Evaluate: 1) Specificity (explicitly mentions AI training?), 2) Clarity (understandable to data subjects?), 3) Granularity (can users consent to specific uses?), 4) Withdrawal ease (simple process?), 5) Documentation (consent records maintained?), 6) Consistency (applied to all AI training data?).", "maturity_indicators": {"level_1": "No consent procedures; data collected without specific AI training consent", "level_2": "General consent obtained but AI training not specifically disclosed", "level_3": "AI-specific consent exists but inconsistently applied or unclear", "level_4": "Comprehensive, clear consent procedures consistently applied", "level_5": "Industry-leading consent with granular control and easy management"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Data Lifecycle Management',
  'D5-Q007',
  'Are data quality assurance processes in place to ensure AI training datasets are accurate, complete, and representative?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No data quality assurance for AI datasets", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic quality checks performed ad hoc", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Systematic quality assurance but gaps in coverage or rigor", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive quality assurance covering accuracy, completeness, and representativeness", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading quality assurance with automated validation, continuous monitoring, and bias detection", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Data quality assurance procedures and standards, 2) Quality metrics and thresholds, 3) Validation and testing results, 4) Examples of quality issues identified and resolved, 5) Automated quality checking tools and processes, 6) Representativeness analysis (demographic coverage, edge cases)."}',
  '{"guidance": "Assess: 1) Comprehensiveness (accuracy, completeness, representativeness all addressed?), 2) Systematic application (all datasets checked?), 3) Rigor (thorough validation?), 4) Automation (automated checks in place?), 5) Continuous monitoring (ongoing quality tracking?), 6) Bias consideration (demographic representation checked?).", "maturity_indicators": {"level_1": "No quality assurance; datasets used as-is without validation", "level_2": "Ad hoc quality checks when issues arise", "level_3": "Systematic quality assurance but incomplete coverage", "level_4": "Comprehensive quality assurance for all datasets", "level_5": "Industry-leading automated quality assurance with continuous monitoring"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Data Lifecycle Management',
  'D5-Q008',
  'Do you maintain comprehensive data lineage tracking that documents the origin, transformations, and usage of data in AI systems?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No data lineage tracking exists", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic documentation of data sources but no transformation tracking", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Data lineage tracked for some AI systems but incomplete or manual", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive data lineage tracking for all AI systems with automated tools", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading data lineage with full traceability, automated tracking, and easy visualization", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Data lineage tracking system or tools used, 2) Examples of lineage documentation for AI systems, 3) Lineage visualization or reports, 4) Coverage of data sources, transformations, and usage, 5) Automated tracking capabilities, 6) Use cases where lineage was critical (audits, investigations, compliance)."}',
  '{"guidance": "Evaluate: 1) Comprehensiveness (origin, transformations, usage all tracked?), 2) Coverage (all AI systems?), 3) Automation (automated tracking vs manual documentation?), 4) Accessibility (easy to query and visualize?), 5) Usefulness (actually used for governance and compliance?), 6) Granularity (detailed enough for accountability?).", "maturity_indicators": {"level_1": "No lineage tracking; data origins and transformations unknown", "level_2": "Basic source documentation but no transformation tracking", "level_3": "Lineage tracked for some systems but incomplete or manual", "level_4": "Comprehensive automated lineage tracking for all systems", "level_5": "Industry-leading lineage with full traceability and visualization"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Data Lifecycle Management',
  'D5-Q009',
  'Are data versioning and change management processes in place for AI training datasets and models?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No versioning or change management for AI data", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic versioning for models but not for training data", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Versioning exists for both data and models but change management is informal", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive versioning and change management with approval workflows", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading versioning with automated change tracking, rollback capabilities, and full audit trails", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Versioning system or tools used (Git, DVC, MLflow, etc.), 2) Examples of versioned datasets and models, 3) Change management procedures and approval workflows, 4) Version history and change logs, 5) Rollback procedures and examples, 6) Integration with AI development lifecycle."}',
  '{"guidance": "Assess: 1) Coverage (both data and models versioned?), 2) Systematic application (all AI systems?), 3) Change management rigor (approval required for changes?), 4) Traceability (can trace any model to exact training data version?), 5) Rollback capability (can revert to previous versions?), 6) Automation (automated versioning vs manual?).", "maturity_indicators": {"level_1": "No versioning; datasets and models overwritten without tracking", "level_2": "Basic model versioning but training data not versioned", "level_3": "Versioning exists but change management informal", "level_4": "Comprehensive versioning with formal change management", "level_5": "Industry-leading versioning with automation and full traceability"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Data Lifecycle Management',
  'D5-Q10',
  'Do you have documented data archival and backup procedures specifically for AI training data, models, and inference data?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No archival or backup procedures for AI data", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "General backup procedures but AI data not specifically addressed", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "AI-specific archival procedures exist but incomplete or inconsistently applied", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive archival and backup procedures for all AI data types with regular testing", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading archival with automated backups, geo-redundancy, and verified recovery procedures", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Archival and backup policy documents, 2) Backup schedules and retention periods, 3) Storage locations and redundancy (geo-redundancy, multiple copies), 4) Recovery procedures and testing results, 5) Examples of successful data recovery, 6) Compliance with regulatory retention requirements."}',
  '{"guidance": "Evaluate: 1) Comprehensiveness (training data, models, inference data all covered?), 2) Frequency (appropriate backup frequency?), 3) Redundancy (multiple copies, geo-distributed?), 4) Testing (recovery procedures tested regularly?), 5) Documentation (clear procedures?), 6) Compliance (meets regulatory retention requirements?).", "maturity_indicators": {"level_1": "No archival or backup; data loss risk is high", "level_2": "General backups but AI data not specifically addressed", "level_3": "AI-specific archival exists but incomplete or untested", "level_4": "Comprehensive archival with regular testing", "level_5": "Industry-leading archival with automation and geo-redundancy"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Privacy Controls',
  'D5-Q11',
  'Are privacy-by-design principles systematically integrated into your AI system development lifecycle?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No privacy-by-design principles applied", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Privacy considered informally but not systematically integrated", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Privacy-by-design principles documented but inconsistently applied", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Privacy-by-design systematically integrated into AI development with regular reviews", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading privacy-by-design with automated privacy checks, continuous validation, and innovation", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Privacy-by-design framework or methodology documentation, 2) Integration points in AI development lifecycle (design reviews, privacy checkpoints), 3) Examples of privacy-by-design implementation in AI projects, 4) Privacy review checklists or templates, 5) Training materials for developers on privacy-by-design, 6) Evidence of privacy considerations in design documents."}',
  '{"guidance": "Evaluate: 1) Systematic integration (embedded in development process vs ad hoc), 2) Coverage (all AI projects?), 3) Timing (privacy considered from start vs retrofitted), 4) Effectiveness (privacy issues prevented vs discovered late), 5) Developer awareness (trained and competent?), 6) Continuous improvement (learnings incorporated?).", "maturity_indicators": {"level_1": "Privacy is an afterthought; addressed reactively when issues arise", "level_2": "Privacy considered informally but not systematically", "level_3": "Privacy-by-design documented but inconsistently applied", "level_4": "Privacy-by-design systematically integrated and effective", "level_5": "Industry-leading privacy-by-design with automation and innovation"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Privacy Controls',
  'D5-Q12',
  'Do you implement data minimization practices to collect and retain only the minimum data necessary for AI system purposes?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No data minimization practices; collect all available data", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal data minimization but no systematic approach", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Data minimization policies exist but enforcement is inconsistent", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Systematic data minimization with regular reviews and justification requirements", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading data minimization with automated enforcement, continuous optimization, and regular audits", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Data minimization policy and procedures, 2) Examples of data collection justification and necessity analysis, 3) Data retention schedules showing minimal retention, 4) Evidence of data deletion when no longer needed, 5) Regular data minimization reviews and audits, 6) Comparison of data collected vs data actually used."}',
  '{"guidance": "Assess: 1) Policy existence and clarity, 2) Systematic application (all AI projects?), 3) Justification rigor (necessity clearly demonstrated?), 4) Enforcement (data minimization actually practiced?), 5) Regular reviews (ongoing optimization?), 6) Effectiveness (minimal data actually collected and retained?).", "maturity_indicators": {"level_1": "Collect all available data without justification or limits", "level_2": "Informal consideration of data minimization", "level_3": "Data minimization policies exist but inconsistently enforced", "level_4": "Systematic data minimization with regular reviews", "level_5": "Industry-leading data minimization with automation and continuous optimization"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Privacy Controls',
  'D5-Q13',
  'Do you enforce purpose limitation to ensure AI data is only used for the specific purposes for which it was collected?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No purpose limitation; data used for any purpose", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal purpose tracking but no enforcement mechanisms", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Purpose limitation policies exist but enforcement is weak or inconsistent", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Strong purpose limitation with technical and procedural controls", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading purpose limitation with automated enforcement, audit trails, and re-consent for new purposes", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Purpose limitation policy and procedures, 2) Data use documentation showing declared purposes, 3) Technical controls preventing unauthorized use (access controls, data tagging), 4) Examples of purpose limitation enforcement (blocked uses, re-consent obtained), 5) Audit trails of data usage, 6) Re-consent procedures for new purposes."}',
  '{"guidance": "Evaluate: 1) Policy clarity (purposes clearly defined?), 2) Technical controls (systems prevent unauthorized use?), 3) Procedural controls (approval required for new uses?), 4) Enforcement evidence (violations detected and addressed?), 5) Re-consent process (new purposes require new consent?), 6) Audit capability (can verify purpose limitation?).", "maturity_indicators": {"level_1": "No purpose limitation; data used freely for any purpose", "level_2": "Informal purpose tracking without enforcement", "level_3": "Purpose limitation policies exist but weakly enforced", "level_4": "Strong purpose limitation with effective controls", "level_5": "Industry-leading purpose limitation with automation and re-consent"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Privacy Controls',
  'D5-Q14',
  'Do you employ anonymization, pseudonymization, or de-identification techniques to protect personal data in AI systems?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No anonymization or de-identification techniques used", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic techniques applied ad hoc without systematic approach", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Anonymization techniques used but effectiveness not validated or inconsistently applied", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive anonymization with validated techniques and regular re-identification testing", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading anonymization with advanced techniques (differential privacy, k-anonymity), continuous validation, and formal privacy guarantees", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Anonymization techniques and methodologies used, 2) Technical implementation details, 3) Validation and re-identification testing results, 4) Risk assessments for anonymized data, 5) Examples of anonymized datasets used in AI, 6) Formal privacy guarantees or certifications (if applicable)."}',
  '{"guidance": "Assess: 1) Techniques appropriateness (suitable for data type and risk?), 2) Systematic application (all personal data anonymized?), 3) Validation rigor (re-identification testing performed?), 4) Effectiveness (anonymization actually prevents re-identification?), 5) Advanced techniques (differential privacy, k-anonymity, etc.?), 6) Continuous monitoring (ongoing validation?).", "maturity_indicators": {"level_1": "No anonymization; personal data used directly in AI systems", "level_2": "Basic anonymization applied ad hoc", "level_3": "Anonymization used but effectiveness not validated", "level_4": "Comprehensive anonymization with validated effectiveness", "level_5": "Industry-leading anonymization with advanced techniques and formal guarantees"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  5,
  'Privacy Controls',
  'D5-Q15',
  'Have you implemented differential privacy or other advanced privacy-preserving techniques in your AI systems?',
  'MEDIUM',
  0.5,
  '[{"value": 1, "label": "No advanced privacy-preserving techniques implemented", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Awareness of advanced techniques but not yet implemented", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Pilot implementation of advanced privacy techniques in some systems", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Differential privacy or similar techniques implemented in most high-risk AI systems", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading implementation of multiple advanced privacy techniques (differential privacy, federated learning, homomorphic encryption) across all systems", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Advanced privacy techniques implemented (differential privacy, federated learning, secure multi-party computation, homomorphic encryption), 2) Technical implementation details and parameters (epsilon values for differential privacy, etc.), 3) Privacy-utility trade-off analysis, 4) Validation of privacy guarantees, 5) Use cases and systems where implemented, 6) Research or innovation in privacy-preserving AI."}',
  '{"guidance": "Evaluate: 1) Techniques sophistication (truly advanced?), 2) Implementation quality (properly configured?), 3) Coverage (which systems use advanced techniques?), 4) Privacy guarantees (formal guarantees provided?), 5) Trade-offs managed (privacy vs utility balanced?), 6) Innovation (contributing to state-of-the-art?).", "maturity_indicators": {"level_1": "No awareness or implementation of advanced privacy techniques", "level_2": "Awareness but no implementation yet", "level_3": "Pilot implementation in limited systems", "level_4": "Implemented in most high-risk systems", "level_5": "Industry-leading implementation across all systems with innovation"}}',
  '{}',
  '[]',
  '{}'
);


-- Domain 5 complete: 15 questions inserted

-- ================================================================================
-- DOMAIN 6: Transparency & Explainability (40 questions)
-- ================================================================================

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  6,
  'Explainability',
  'D6-Q001',
  'Do you provide clear, understandable explanations of how your AI systems make decisions?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No explanations provided; AI systems are black boxes", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Minimal technical explanations provided only when requested", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic explanations provided but may be too technical for non-experts", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Clear explanations provided in user-friendly language for most systems", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive, multi-level explanations (technical and non-technical) for all systems", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide examples of explanations provided to users, including: 1) User-facing explanation interfaces, 2) Technical documentation, 3) Model cards or system documentation, 4) User feedback on explanation quality, 5) Different explanation levels for different audiences."}',
  '{"guidance": "Assess: 1) Clarity and understandability for target audience, 2) Completeness (covers key decision factors), 3) Accessibility (easy to find and understand), 4) Appropriateness for risk level, 5) User satisfaction with explanations.", "maturity_indicators": {"level_1": "No explanations; complete opacity", "level_2": "Minimal, technical-only explanations", "level_3": "Basic explanations but not user-friendly", "level_4": "Clear, accessible explanations for most systems", "level_5": "Comprehensive, multi-level explanations for all systems"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  6,
  'Documentation',
  'D6-Q002',
  'Are model cards or comprehensive documentation available for all AI systems in production?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No model documentation exists", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Minimal documentation for some systems", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic model cards exist for most systems but are incomplete", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive model cards for all production systems", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive model cards with continuous updates and public availability where appropriate", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide sample model cards including: 1) Model details (architecture, training data), 2) Intended use and limitations, 3) Performance metrics, 4) Fairness and bias testing results, 5) Ethical considerations, 6) Update history."}',
  '{"guidance": "Review model cards for: 1) Completeness (all required sections), 2) Currency (regularly updated), 3) Accessibility (easy to find and understand), 4) Honesty about limitations, 5) Actionable information for users and stakeholders.", "maturity_indicators": {"level_1": "No documentation; tribal knowledge only", "level_2": "Minimal, ad hoc documentation", "level_3": "Basic documentation but incomplete", "level_4": "Comprehensive documentation for all systems", "level_5": "Comprehensive, continuously updated, publicly available"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  6,
  'Contestability',
  'D6-Q003',
  'Can users contest or appeal decisions made by AI systems?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No contestability mechanisms exist", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal processes exist but are not well-defined", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Formal appeal processes exist but are cumbersome or slow", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Efficient appeal processes with human review for all contestable decisions", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive contestability framework with multiple channels, fast response, and continuous improvement", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Contestability policy and procedures, 2) Examples of appeals processed, 3) Response time metrics, 4) Overturn rates, 5) User satisfaction with appeal process, 6) Continuous improvement based on appeals."}',
  '{"guidance": "Assess: 1) Accessibility of appeal process, 2) Clarity of procedures, 3) Response times, 4) Quality of human review, 5) Fairness of outcomes, 6) Learning from appeals to improve systems.", "maturity_indicators": {"level_1": "No way to contest AI decisions", "level_2": "Informal, unclear appeal processes", "level_3": "Formal processes but inefficient", "level_4": "Efficient appeal processes with human review", "level_5": "Comprehensive contestability with continuous improvement"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  6,
  'Audit Trails',
  'D6-Q004',
  'Do you maintain comprehensive audit trails of AI system decisions and the factors that influenced them?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No audit trails maintained", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic logging of decisions but not influencing factors", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Audit trails exist but are incomplete or difficult to interpret", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive audit trails for most systems with key influencing factors", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Complete audit trails for all systems with full traceability and easy analysis tools", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Audit trail architecture and design, 2) Sample audit logs showing decisions and factors, 3) Retention policies for audit data, 4) Analysis and reporting tools, 5) Examples of audit trail use in investigations or appeals."}',
  '{"guidance": "Evaluate: 1) Completeness (all decisions logged with factors), 2) Retention period (adequate for compliance and investigation), 3) Accessibility (can be retrieved and analyzed), 4) Integrity (tamper-proof), 5) Usefulness (actually used for accountability).", "maturity_indicators": {"level_1": "No logging or audit trails", "level_2": "Basic decision logging only", "level_3": "Audit trails exist but incomplete", "level_4": "Comprehensive audit trails for most systems", "level_5": "Complete, analyzable audit trails for all systems"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  6,
  'Stakeholder Communication',
  'D6-Q005',
  'Are stakeholders (users, affected parties, regulators) proactively informed about AI system capabilities, limitations, and risks?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No proactive communication about AI systems", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Minimal communication, only when required by regulation", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic communication about AI use but limited detail on limitations and risks", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive communication to most stakeholders about capabilities, limitations, and risks", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Proactive, multi-channel communication to all stakeholders with regular updates and engagement", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Stakeholder communication materials (notices, disclosures, reports), 2) Communication channels and frequency, 3) Stakeholder feedback mechanisms, 4) Examples of limitation and risk disclosures, 5) Transparency reports or public disclosures."}',
  '{"guidance": "Assess: 1) Proactivity (not just reactive), 2) Comprehensiveness (covers capabilities, limitations, risks), 3) Accessibility (clear, understandable language), 4) Reach (all relevant stakeholders), 5) Engagement (two-way communication, feedback incorporated).", "maturity_indicators": {"level_1": "No stakeholder communication", "level_2": "Minimal, compliance-driven communication", "level_3": "Basic communication but limited detail", "level_4": "Comprehensive communication to most stakeholders", "level_5": "Proactive, comprehensive, multi-channel communication"}}',
  '{}',
  '[]',
  '{}'
);


-- Domain 6 complete: 5 questions inserted

-- ================================================================================
-- DOMAIN 7: Social Impact & Global Equity (40 questions)
-- ================================================================================

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  7,
  'Impact Assessment',
  'D7-Q001',
  'Do you conduct comprehensive social impact assessments before deploying AI systems?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No social impact assessments conducted", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal consideration of social impacts but no structured assessment", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic social impact assessments for high-risk systems only", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive social impact assessments for all AI systems with stakeholder input", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Rigorous social impact assessments with ongoing monitoring and community engagement", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Social impact assessment methodology, 2) Examples of completed assessments, 3) Stakeholder consultation records, 4) Impact mitigation plans, 5) Monitoring and evaluation procedures."}',
  '{"guidance": "Evaluate: 1) Assessment comprehensiveness (covers all potential impacts), 2) Stakeholder involvement (affected communities consulted), 3) Mitigation measures (concrete actions taken), 4) Monitoring (ongoing impact tracking), 5) Transparency (results shared with stakeholders).", "maturity_indicators": {"level_1": "No consideration of social impacts", "level_2": "Informal, ad hoc consideration", "level_3": "Basic assessments for high-risk systems", "level_4": "Comprehensive assessments with stakeholder input", "level_5": "Rigorous assessments with ongoing monitoring"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  7,
  'Bias & Fairness',
  'D7-Q002',
  'Are bias detection and mitigation processes systematically applied to all AI systems?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No bias detection or mitigation processes", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Ad hoc bias testing for some systems", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Systematic bias testing but limited mitigation", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive bias detection and mitigation for all systems", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading bias detection with continuous monitoring and proactive mitigation", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Bias detection methodology and tools, 2) Testing results for AI systems, 3) Mitigation strategies implemented, 4) Effectiveness measurements, 5) Continuous monitoring procedures."}',
  '{"guidance": "Assess: 1) Systematic application (all systems tested), 2) Comprehensiveness (multiple bias types), 3) Effectiveness of mitigation, 4) Continuous monitoring, 5) Transparency about limitations.", "maturity_indicators": {"level_1": "No bias detection", "level_2": "Ad hoc testing only", "level_3": "Systematic testing but limited mitigation", "level_4": "Comprehensive detection and mitigation", "level_5": "Industry-leading with continuous monitoring"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  7,
  'Fairness Evaluation',
  'D7-Q003',
  'Do you evaluate fairness across different demographic groups (race, gender, age, disability, etc.) for AI systems?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No fairness evaluation across demographic groups", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Limited fairness testing for obvious protected groups only", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Fairness testing across major demographic groups but gaps exist", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive fairness evaluation across all relevant demographic groups", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Rigorous fairness evaluation with intersectional analysis and continuous monitoring", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Fairness testing methodology, 2) Demographic groups analyzed, 3) Fairness metrics used, 4) Testing results and disparities found, 5) Mitigation actions taken, 6) Intersectional analysis (if conducted)."}',
  '{"guidance": "Assess: 1) Coverage of demographic groups (comprehensive?), 2) Fairness metrics appropriateness, 3) Intersectional analysis (multiple dimensions), 4) Mitigation effectiveness, 5) Continuous monitoring, 6) Transparency about trade-offs.", "maturity_indicators": {"level_1": "No demographic fairness evaluation", "level_2": "Limited testing for obvious groups", "level_3": "Testing across major groups but gaps exist", "level_4": "Comprehensive evaluation across all groups", "level_5": "Rigorous evaluation with intersectional analysis"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  7,
  'Accessibility',
  'D7-Q004',
  'Are accessibility features systematically included in AI systems to ensure usability for people with disabilities?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No accessibility considerations in AI systems", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Minimal accessibility features, added reactively when issues arise", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic accessibility features included but not comprehensive", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive accessibility features following WCAG guidelines", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading accessibility with universal design principles and continuous user testing", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Accessibility standards and guidelines followed, 2) Accessibility features implemented, 3) Testing with users with disabilities, 4) Accessibility audit results, 5) Continuous improvement processes."}',
  '{"guidance": "Assess: 1) Standards compliance (WCAG, ADA, etc.), 2) Feature comprehensiveness (visual, auditory, motor, cognitive), 3) User testing with people with disabilities, 4) Continuous improvement, 5) Proactive vs reactive approach.", "maturity_indicators": {"level_1": "No accessibility considerations", "level_2": "Minimal, reactive accessibility", "level_3": "Basic accessibility but not comprehensive", "level_4": "Comprehensive accessibility following standards", "level_5": "Industry-leading universal design"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  7,
  'Global Equity',
  'D7-Q005',
  'Do you consider global equity and benefit distribution when designing and deploying AI systems?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No consideration of global equity", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Minimal consideration, focused only on primary markets", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Some consideration of equity but not systematically applied", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Systematic consideration of global equity in AI system design", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive global equity framework with proactive benefit distribution strategies", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Global equity policy or framework, 2) Examples of equity considerations in AI design, 3) Benefit distribution analysis, 4) Underserved community engagement, 5) Equity metrics and monitoring."}',
  '{"guidance": "Assess: 1) Systematic consideration (not ad hoc), 2) Global perspective (beyond primary markets), 3) Concrete actions taken, 4) Benefit distribution analysis, 5) Engagement with underserved communities.", "maturity_indicators": {"level_1": "No equity considerations", "level_2": "Minimal, market-focused only", "level_3": "Some consideration but not systematic", "level_4": "Systematic equity consideration", "level_5": "Comprehensive equity framework with proactive strategies"}}',
  '{}',
  '[]',
  '{}'
);


-- Domain 7 complete: 5 questions inserted

-- ================================================================================
-- DOMAIN 8: Environmental Sustainability (40 questions)
-- ================================================================================

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  8,
  'Carbon Measurement',
  'D8-Q001',
  'Do you measure and track the carbon footprint of your AI systems (training and inference)?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No carbon footprint measurement", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal estimates but no systematic measurement", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic measurement for some AI systems", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive measurement for all AI systems with regular reporting", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive measurement with real-time monitoring, public reporting, and reduction targets", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Carbon measurement methodology, 2) Measurement tools and systems used, 3) Carbon footprint reports for AI systems, 4) Baseline measurements and trends, 5) Reduction targets and progress."}',
  '{"guidance": "Evaluate: 1) Measurement methodology (comprehensive and accurate?), 2) Coverage (all AI systems?), 3) Frequency (regular measurement?), 4) Reporting (internal and external?), 5) Action (targets and reduction efforts?).", "maturity_indicators": {"level_1": "No measurement or awareness", "level_2": "Informal estimates only", "level_3": "Basic measurement for some systems", "level_4": "Comprehensive measurement with reporting", "level_5": "Real-time monitoring with public reporting and targets"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  8,
  'Energy Efficiency',
  'D8-Q002',
  'Are energy efficiency considerations integrated into AI model design and selection decisions?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No energy efficiency considerations", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal consideration but not a decision factor", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Energy efficiency considered but often deprioritized for performance", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Energy efficiency is a key factor in model design and selection", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Energy efficiency is a primary design criterion with systematic optimization", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Model selection criteria including energy efficiency, 2) Examples of energy-efficient model choices, 3) Energy efficiency benchmarks and comparisons, 4) Optimization techniques used, 5) Trade-off analysis (performance vs efficiency)."}',
  '{"guidance": "Assess: 1) Systematic consideration (not ad hoc), 2) Weight in decision-making, 3) Optimization techniques applied, 4) Measurement and comparison, 5) Balance with other requirements.", "maturity_indicators": {"level_1": "No energy efficiency consideration", "level_2": "Informal consideration only", "level_3": "Considered but often deprioritized", "level_4": "Key factor in design decisions", "level_5": "Primary design criterion with systematic optimization"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  8,
  'Resource Optimization',
  'D8-Q003',
  'Do you optimize computational resources to minimize environmental impact (e.g., model compression, efficient architectures)?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No resource optimization for environmental reasons", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic optimization for cost reasons, environmental benefit is incidental", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Some optimization techniques applied with environmental awareness", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Systematic optimization using multiple techniques (compression, pruning, distillation)", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive optimization strategy with continuous improvement and innovation", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Optimization techniques used (model compression, pruning, quantization, distillation), 2) Before/after resource usage comparisons, 3) Environmental impact reduction achieved, 4) Optimization guidelines and standards, 5) Innovation in efficiency."}',
  '{"guidance": "Evaluate: 1) Range of techniques used, 2) Systematic application (not ad hoc), 3) Measurable impact, 4) Balance with performance requirements, 5) Continuous improvement and innovation.", "maturity_indicators": {"level_1": "No optimization efforts", "level_2": "Cost-driven optimization only", "level_3": "Some optimization with environmental awareness", "level_4": "Systematic optimization using multiple techniques", "level_5": "Comprehensive strategy with continuous innovation"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  8,
  'Infrastructure Impact',
  'D8-Q004',
  'Are environmental impact assessments conducted for AI infrastructure (data centers, hardware)?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No environmental impact assessments", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic assessments for major infrastructure changes only", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Regular assessments but limited scope or depth", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive assessments for all significant infrastructure decisions", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Rigorous lifecycle assessments with continuous monitoring and public reporting", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Environmental impact assessment methodology, 2) Examples of completed assessments, 3) Infrastructure environmental metrics, 4) Mitigation measures implemented, 5) Monitoring and reporting procedures."}',
  '{"guidance": "Assess: 1) Assessment comprehensiveness (full lifecycle?), 2) Coverage (all infrastructure?), 3) Mitigation actions taken, 4) Monitoring and reporting, 5) Continuous improvement.", "maturity_indicators": {"level_1": "No environmental assessments", "level_2": "Basic assessments for major changes only", "level_3": "Regular assessments but limited scope", "level_4": "Comprehensive assessments for all decisions", "level_5": "Rigorous lifecycle assessments with continuous monitoring"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  8,
  'Environmental Targets',
  'D8-Q005',
  'Do you have specific targets for reducing the energy consumption and environmental impact of AI systems?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No environmental targets for AI systems", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal goals but no specific targets", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Some targets set but not comprehensive or time-bound", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive, time-bound targets with regular progress tracking", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Ambitious, science-based targets with public commitments and transparent reporting", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide: 1) Environmental targets document, 2) Baseline measurements, 3) Progress tracking reports, 4) Target achievement timeline, 5) Public commitments or disclosures."}',
  '{"guidance": "Evaluate: 1) Target specificity (measurable and time-bound?), 2) Ambition level (aligned with science-based targets?), 3) Progress tracking, 4) Accountability (public commitments?), 5) Achievement likelihood.", "maturity_indicators": {"level_1": "No targets set", "level_2": "Informal goals only", "level_3": "Some targets but not comprehensive", "level_4": "Comprehensive, time-bound targets with tracking", "level_5": "Ambitious, science-based targets with public commitments"}}',
  '{}',
  '[]',
  '{}'
);


-- Domain 8 complete: 5 questions inserted

-- ================================================================================
-- SUMMARY: 30 questions inserted (Domains 5-8)
-- ================================================================================
-- Next: Create Domain 1-4 questions (27 questions) to reach 187 total
-- ================================================================================
