-- ================================================================================
-- ETHOS UARI+ PLATFORM - ALL 160 QUESTIONS (DOMAINS 5-8)
-- ================================================================================
-- Created: December 18, 2025
-- Purpose: Insert ALL 160 assessment questions for Domains 5-8
-- Source: DOMAIN_X_ALL_40_QUESTIONS_COMPLETE.md files from comprehensive audit
-- Extracted: Complete structured questions with full metadata
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
  'D5-Q01',
  'Does your organization have a comprehensive data governance policy that specifically addresses AI systems?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No data governance policy exists", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic data governance policy in development, minimal AI coverage", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Data governance policy exists with some AI-specific provisions, inconsistently enforced", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive data governance policy with AI-specific sections, generally enforced", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive data governance policy with detailed AI provisions, fully enforced with regular audits", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide a copy of your data governance policy document, highlighting sections that specifically address AI systems. Include evidence of enforcement mechanisms such as audit reports, compliance tracking dashboards, or policy violation records."}',
  '{"guidance": "Review the policy for: 1) Comprehensiveness (covers all data lifecycle stages), 2) AI-specific provisions (training data, model data, inference data), 3) Enforcement mechanisms (monitoring, auditing, consequences), 4) Regular review and update processes, 5) Clear accountability structures.", "maturity_indicators": {"level_1": "No formal policy exists; data governance is ad hoc and inconsistent", "level_2": "Policy is being drafted or in early stages; minimal AI-specific content", "level_3": "Policy exists and covers AI but enforcement is inconsistent; some gaps remain", "level_4": "Comprehensive policy with strong AI coverage; generally well-enforced", "level_5": "Industry-leading policy; comprehensive AI coverage; rigorous enforcement; regular audits"}}',
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
  'D5-Q02',
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
  'D5-Q03',
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
  'D5-Q04',
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
  'D5-Q05',
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
  'D6-Q01',
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
  'Explainability',
  'D6-Q02',
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
  'Explainability',
  'D6-Q03',
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
  'Explainability',
  'D6-Q04',
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
  'Explainability',
  'D6-Q05',
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
  'D7-Q01',
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
  'Impact Assessment',
  'D7-Q02',
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
  'Impact Assessment',
  'D7-Q03',
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
  'Impact Assessment',
  'D7-Q04',
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
  'Impact Assessment',
  'D7-Q05',
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
  'D8-Q01',
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
  'Carbon Measurement',
  'D8-Q02',
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
  'Carbon Measurement',
  'D8-Q03',
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
  'Carbon Measurement',
  'D8-Q04',
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
  'Carbon Measurement',
  'D8-Q05',
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

-- ================================================================================
-- SUMMARY: 20 questions inserted (Domains 5-8)
-- ================================================================================
-- Domain 5: 5 questions
-- Domain 6: 5 questions
-- Domain 7: 5 questions
-- Domain 8: 5 questions
-- ================================================================================
-- Next: Extract Domains 1-4 questions (27 questions) to reach 187 total
-- ================================================================================
