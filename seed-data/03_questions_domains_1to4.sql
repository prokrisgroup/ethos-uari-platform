-- ================================================================================
-- ETHOS UARI+ PLATFORM - QUESTIONS SEED DATA (DOMAINS 1-4)
-- ================================================================================
-- Created: December 18, 2025
-- Purpose: Insert representative questions for Domains 1-4
-- Source: PHASE1_ASSESSMENT_FRAMEWORK_ARCHITECTURE.md
-- Total: D1=5, D2=6, D3=5, D4=5 questions (21 foundational questions)
-- Note: Represents framework structure; additional questions to be added iteratively
-- ================================================================================

-- ================================================================================
-- DOMAIN 1: Ethical Leadership & Governance (5 representative questions)
-- Target: 20 questions total (these demonstrate the framework)
-- ================================================================================

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  1,
  'Governance Structure',
  'D1-Q001',
  'Does your organization have a dedicated AI ethics governance structure (e.g., AI Ethics Board, Committee)?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No governance structure exists", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal oversight, no formal structure", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Governance structure exists but limited authority", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Formal governance structure with clear authority and oversight", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive governance structure with executive authority and regular reporting", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide governance charter, committee composition, meeting frequency, decision-making authority, and examples of governance decisions."}',
  '{"guidance": "Evaluate: 1) Formal structure and documentation, 2) Decision-making authority, 3) Executive-level involvement, 4) Regular meetings and reporting, 5) Demonstrated impact on AI deployment.", "maturity_indicators": {"level_1": "No structure", "level_2": "Informal only", "level_3": "Structure exists, limited authority", "level_4": "Formal structure with authority", "level_5": "Comprehensive with executive oversight"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  1,
  'Policy Frameworks',
  'D1-Q002',
  'Do you have a comprehensive AI ethics policy that covers principles, values, and operational guidelines?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No AI ethics policy", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Policy in development, not yet approved", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic policy exists, limited enforcement", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive policy with active enforcement", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading policy with rigorous enforcement and public disclosure", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide AI ethics policy document, implementation guidelines, enforcement mechanisms, and compliance tracking."}',
  '{"guidance": "Review: 1) Policy comprehensiveness, 2) Clear principles and values, 3) Operational guidelines, 4) Enforcement mechanisms, 5) Regular updates and reviews.", "maturity_indicators": {"level_1": "No policy", "level_2": "In development", "level_3": "Basic policy, limited enforcement", "level_4": "Comprehensive with enforcement", "level_5": "Industry-leading with public disclosure"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  1,
  'Stakeholder Engagement',
  'D1-Q003',
  'Are stakeholders (employees, customers, civil society) engaged in AI governance and decision-making?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No stakeholder engagement", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Limited engagement, ad hoc consultation", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Regular engagement with some stakeholder groups", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Systematic engagement across multiple stakeholder groups", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive multi-stakeholder governance with meaningful participation", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide stakeholder engagement strategy, consultation records, feedback mechanisms, and examples of stakeholder influence on decisions."}',
  '{"guidance": "Assess: 1) Breadth of stakeholder engagement, 2) Meaningful participation, 3) Documented feedback, 4) Evidence of influence, 5) Regular engagement processes.", "maturity_indicators": {"level_1": "No engagement", "level_2": "Ad hoc consultation", "level_3": "Regular with some groups", "level_4": "Systematic across groups", "level_5": "Comprehensive multi-stakeholder governance"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  1,
  'Accountability',
  'D1-Q004',
  'Are clear roles and responsibilities defined for AI system development, deployment, and monitoring?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No defined roles or responsibilities", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal roles, unclear accountability", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Roles defined but accountability gaps exist", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Clear roles and accountability across lifecycle", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive accountability framework with regular audits", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide RACI matrix or accountability framework, role descriptions, escalation procedures, and audit reports."}',
  '{"guidance": "Evaluate: 1) Clarity of roles, 2) Coverage of full AI lifecycle, 3) Accountability mechanisms, 4) Escalation processes, 5) Regular accountability reviews.", "maturity_indicators": {"level_1": "No defined roles", "level_2": "Informal roles", "level_3": "Roles defined, gaps exist", "level_4": "Clear roles and accountability", "level_5": "Comprehensive with regular audits"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  1,
  'Ethics Oversight',
  'D1-Q005',
  'Is there a process for ethical review of AI systems before deployment?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No ethical review process", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal ethical considerations, no formal review", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Ethical review for high-risk systems only", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Formal ethical review for all AI systems", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Rigorous multi-stage ethical review with independent oversight", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide ethical review process documentation, review criteria, decision records, and examples of approved/rejected systems."}',
  '{"guidance": "Review: 1) Process formalization, 2) Review criteria and standards, 3) Independent oversight, 4) Documentation, 5) Compliance enforcement.", "maturity_indicators": {"level_1": "No process", "level_2": "Informal considerations", "level_3": "Review for high-risk only", "level_4": "Formal review for all systems", "level_5": "Rigorous multi-stage with independence"}}',
  '{}',
  '[]',
  '{}'
);

-- Domain 1 complete: 5 questions inserted

-- ================================================================================
-- DOMAIN 2: Purpose-Driven Innovation (6 representative questions)
-- Target: 25 questions total
-- ================================================================================

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  2,
  'Value Alignment',
  'D2-Q001',
  'Are AI innovation initiatives explicitly aligned with organizational values and social benefit?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No value alignment consideration", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal value considerations", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Value alignment assessed for major projects", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Systematic value alignment for all AI initiatives", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive value-driven innovation with measurable social benefit", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide innovation framework, value alignment criteria, project approval process, and social benefit metrics."}',
  '{"guidance": "Assess: 1) Explicit alignment process, 2) Integration in decision-making, 3) Social benefit measurement, 4) Regular reviews, 5) Impact evidence.", "maturity_indicators": {"level_1": "No alignment", "level_2": "Informal only", "level_3": "Major projects assessed", "level_4": "Systematic for all initiatives", "level_5": "Comprehensive value-driven"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  2,
  'Innovation Ethics',
  'D2-Q002',
  'Are ethical considerations integrated into the AI innovation and experimentation process?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No ethical integration in innovation", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Ad hoc ethical discussions", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Ethical checkpoints for some innovations", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Integrated ethical review throughout innovation", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Ethics-by-design with proactive risk mitigation", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide innovation process documentation, ethical review checkpoints, risk assessment templates, and example evaluations."}',
  '{"guidance": "Evaluate: 1) Process integration, 2) Timing of ethical review, 3) Risk assessment quality, 4) Mitigation effectiveness, 5) Continuous improvement.", "maturity_indicators": {"level_1": "No integration", "level_2": "Ad hoc discussions", "level_3": "Some checkpoints", "level_4": "Integrated throughout", "level_5": "Ethics-by-design"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  2,
  'Responsible Experimentation',
  'D2-Q003',
  'Do you have safeguards for responsible AI experimentation and prototyping?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No experimentation safeguards", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic technical safeguards only", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Some ethical and technical safeguards", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive safeguards for experimentation", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Rigorous safeguards with independent oversight and public transparency", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide experimentation guidelines, safeguard protocols, approval processes, monitoring procedures, and incident reports."}',
  '{"guidance": "Review: 1) Safeguard comprehensiveness, 2) Coverage of risks, 3) Monitoring effectiveness, 4) Incident response, 5) Transparency.", "maturity_indicators": {"level_1": "No safeguards", "level_2": "Technical only", "level_3": "Some ethical and technical", "level_4": "Comprehensive", "level_5": "Rigorous with oversight"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  2,
  'Impact Assessment',
  'D2-Q004',
  'Are potential societal impacts assessed before deploying AI innovations?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No impact assessments conducted", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Limited technical impact assessment only", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Impact assessment for high-visibility projects", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive impact assessment for all deployments", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Rigorous multi-stakeholder impact assessment with public reporting", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide impact assessment methodology, completed assessments, stakeholder input, mitigation plans, and monitoring reports."}',
  '{"guidance": "Assess: 1) Assessment methodology, 2) Scope (technical, social, economic), 3) Stakeholder involvement, 4) Mitigation planning, 5) Post-deployment monitoring.", "maturity_indicators": {"level_1": "No assessments", "level_2": "Technical only", "level_3": "High-visibility projects", "level_4": "Comprehensive for all", "level_5": "Rigorous multi-stakeholder"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  2,
  'Innovation Governance',
  'D2-Q005',
  'Is there governance oversight of AI innovation projects and experiments?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No governance oversight", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Informal oversight for major projects", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Governance review for high-risk innovations", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Systematic governance for all AI projects", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive governance with stage-gate reviews and independent oversight", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide governance framework, review processes, decision criteria, approval records, and oversight reports."}',
  '{"guidance": "Evaluate: 1) Governance structure, 2) Review frequency and rigor, 3) Decision authority, 4) Independence of oversight, 5) Continuous monitoring.", "maturity_indicators": {"level_1": "No oversight", "level_2": "Informal for major projects", "level_3": "High-risk reviewed", "level_4": "Systematic for all", "level_5": "Comprehensive with independence"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  2,
  'Sustainable Innovation',
  'D2-Q006',
  'Do innovation practices consider long-term sustainability and responsible scaling?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No sustainability consideration", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Cost-focused efficiency only", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Some environmental and social considerations", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Integrated sustainability assessment", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive sustainability-first innovation strategy", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide sustainability criteria, scaling guidelines, environmental and social impact assessments, and long-term planning."}',
  '{"guidance": "Review: 1) Sustainability criteria, 2) Scaling assessment, 3) Long-term planning, 4) Environmental consideration, 5) Social responsibility.", "maturity_indicators": {"level_1": "No consideration", "level_2": "Cost-focused only", "level_3": "Some considerations", "level_4": "Integrated assessment", "level_5": "Sustainability-first"}}',
  '{}',
  '[]',
  '{}'
);

-- Domain 2 complete: 6 questions inserted

-- ================================================================================
-- DOMAIN 3: Human-Centricity & Agency (5 representative questions)
-- Target: 22 questions total
-- ================================================================================

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  3,
  'Human Autonomy',
  'D3-Q001',
  'Do AI systems preserve human autonomy and support meaningful human decision-making?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No consideration of human autonomy", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Limited human override capabilities", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Human oversight for critical decisions", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Human-in-the-loop for all significant decisions", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive human autonomy preservation with meaningful control", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide system design documentation, human override mechanisms, decision authority frameworks, and usage logs."}',
  '{"guidance": "Assess: 1) Human control mechanisms, 2) Override capabilities, 3) Decision authority, 4) Meaningful participation, 5) Autonomy preservation.", "maturity_indicators": {"level_1": "No autonomy consideration", "level_2": "Limited override", "level_3": "Oversight for critical", "level_4": "Human-in-loop for significant", "level_5": "Comprehensive preservation"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  3,
  'User Control',
  'D3-Q002',
  'Do users have meaningful control over how AI systems affect them?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No user control mechanisms", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Limited opt-out options", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic control settings available", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive user control options", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Extensive user control with personalization and transparency", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide user interface documentation, control options, preference settings, opt-out procedures, and user feedback."}',
  '{"guidance": "Evaluate: 1) Control options available, 2) Ease of use, 3) Effectiveness of controls, 4) User awareness, 5) Feedback integration.", "maturity_indicators": {"level_1": "No control", "level_2": "Limited opt-out", "level_3": "Basic settings", "level_4": "Comprehensive options", "level_5": "Extensive with personalization"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  3,
  'Consent Management',
  'D3-Q003',
  'Are appropriate consent mechanisms in place for AI system use and data processing?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No consent mechanisms", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic blanket consent", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Informed consent for some purposes", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Granular informed consent", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Dynamic consent with ongoing management and easy withdrawal", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide consent processes, consent language, granularity options, withdrawal procedures, and compliance records."}',
  '{"guidance": "Review: 1) Consent quality, 2) Granularity, 3) Clarity, 4) Withdrawal ease, 5) Compliance verification.", "maturity_indicators": {"level_1": "No consent", "level_2": "Basic blanket", "level_3": "Informed for some", "level_4": "Granular informed", "level_5": "Dynamic with management"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  3,
  'Accessibility',
  'D3-Q004',
  'Are AI systems designed to be accessible to people with disabilities?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No accessibility considerations", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic accessibility features", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Compliance with accessibility standards", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive accessibility by design", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Universal design with continuous accessibility improvement", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide accessibility guidelines, design documentation, testing results, user feedback, and compliance certifications."}',
  '{"guidance": "Assess: 1) Accessibility features, 2) Standards compliance, 3) Testing rigor, 4) User feedback, 5) Continuous improvement.", "maturity_indicators": {"level_1": "No consideration", "level_2": "Basic features", "level_3": "Standards compliance", "level_4": "By-design approach", "level_5": "Universal design"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  3,
  'Inclusion',
  'D3-Q005',
  'Do AI systems support diverse users and avoid exclusionary design?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No diversity or inclusion consideration", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Limited diversity in design process", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Diversity assessment for some systems", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Systematic inclusive design practices", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive inclusion with diverse user testing and co-design", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide inclusive design guidelines, diverse user testing, co-design processes, and impact assessments."}',
  '{"guidance": "Evaluate: 1) Design process diversity, 2) User testing breadth, 3) Co-design practices, 4) Impact measurement, 5) Continuous improvement.", "maturity_indicators": {"level_1": "No consideration", "level_2": "Limited diversity", "level_3": "Some assessment", "level_4": "Systematic practices", "level_5": "Comprehensive inclusion"}}',
  '{}',
  '[]',
  '{}'
);

-- Domain 3 complete: 5 questions inserted

-- ================================================================================
-- DOMAIN 4: Safety, Robustness & Reliability (5 representative questions)
-- Target: 20 questions total
-- ================================================================================

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  4,
  'System Safety',
  'D4-Q001',
  'Are comprehensive safety protocols in place for AI systems?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No safety protocols", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic safety checks for critical systems", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Safety protocols for high-risk systems", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive safety protocols for all systems", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Rigorous multi-layered safety with continuous monitoring", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide safety protocol documentation, risk assessments, safety testing results, monitoring procedures, and incident reports."}',
  '{"guidance": "Review: 1) Protocol comprehensiveness, 2) Risk coverage, 3) Testing rigor, 4) Monitoring effectiveness, 5) Incident response.", "maturity_indicators": {"level_1": "No protocols", "level_2": "Basic for critical", "level_3": "High-risk covered", "level_4": "Comprehensive for all", "level_5": "Multi-layered with monitoring"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  4,
  'Robustness Testing',
  'D4-Q002',
  'Is systematic robustness testing conducted for AI systems?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No robustness testing", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic functional testing only", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Some adversarial and edge case testing", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive robustness testing suite", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Rigorous testing with continuous red-teaming and stress testing", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide testing methodology, test cases, adversarial testing results, edge case coverage, and failure analysis."}',
  '{"guidance": "Assess: 1) Testing comprehensiveness, 2) Adversarial testing, 3) Edge case coverage, 4) Failure analysis, 5) Continuous testing.", "maturity_indicators": {"level_1": "No testing", "level_2": "Basic functional", "level_3": "Some adversarial", "level_4": "Comprehensive suite", "level_5": "Continuous red-teaming"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  4,
  'Failure Mode Analysis',
  'D4-Q003',
  'Are potential failure modes identified and mitigated?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No failure mode analysis", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Reactive failure response only", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic failure mode identification", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Systematic FMEA with mitigation", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Comprehensive FMEA with proactive risk reduction", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide FMEA documentation, identified failure modes, risk assessments, mitigation strategies, and monitoring plans."}',
  '{"guidance": "Evaluate: 1) Analysis comprehensiveness, 2) Failure mode coverage, 3) Mitigation effectiveness, 4) Proactive approach, 5) Continuous review.", "maturity_indicators": {"level_1": "No analysis", "level_2": "Reactive only", "level_3": "Basic identification", "level_4": "Systematic FMEA", "level_5": "Comprehensive proactive"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  4,
  'Incident Response',
  'D4-Q004',
  'Is there an effective incident response plan for AI system failures?',
  'CRITICAL',
  1.5,
  '[{"value": 1, "label": "No incident response plan", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Ad hoc incident response", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Basic incident response plan", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive incident response with regular drills", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Industry-leading incident response with 24/7 monitoring", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide incident response plan, escalation procedures, response times, drill records, and post-incident reviews."}',
  '{"guidance": "Review: 1) Plan comprehensiveness, 2) Response capabilities, 3) Escalation clarity, 4) Testing frequency, 5) Continuous improvement.", "maturity_indicators": {"level_1": "No plan", "level_2": "Ad hoc", "level_3": "Basic plan", "level_4": "Comprehensive with drills", "level_5": "Industry-leading"}}',
  '{}',
  '[]',
  '{}'
);

INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  4,
  'Reliability Monitoring',
  'D4-Q005',
  'Is continuous reliability monitoring in place for deployed AI systems?',
  'HIGH',
  1.0,
  '[{"value": 1, "label": "No reliability monitoring", "score": 1.0, "maturity_level": 1}, {"value": 2, "label": "Basic uptime monitoring only", "score": 2.0, "maturity_level": 2}, {"value": 3, "label": "Performance metrics monitored", "score": 3.0, "maturity_level": 3}, {"value": 4, "label": "Comprehensive reliability dashboard", "score": 4.0, "maturity_level": 4}, {"value": 5, "label": "Real-time monitoring with predictive alerts and auto-remediation", "score": 5.0, "maturity_level": 5}]',
  '{"required": true, "guidance": "Provide monitoring architecture, metrics tracked, alerting systems, dashboard access, and reliability reports."}',
  '{"guidance": "Assess: 1) Monitoring coverage, 2) Metrics comprehensiveness, 3) Alerting effectiveness, 4) Response automation, 5) Predictive capabilities.", "maturity_indicators": {"level_1": "No monitoring", "level_2": "Basic uptime", "level_3": "Performance metrics", "level_4": "Comprehensive dashboard", "level_5": "Real-time with prediction"}}',
  '{}',
  '[]',
  '{}'
);

-- Domain 4 complete: 5 questions inserted

-- ================================================================================
-- SUMMARY: 21 foundational questions inserted (Domains 1-4)
-- ================================================================================
-- Domain 1: 5 questions (target 20 total)
-- Domain 2: 6 questions (target 25 total)
-- Domain 3: 5 questions (target 22 total)
-- Domain 4: 5 questions (target 20 total)
-- ================================================================================
-- Combined with Domains 5-8 (30 questions), total foundational: 51 questions
-- These represent the complete framework structure
-- Additional questions to be added iteratively based on operational needs
-- ================================================================================
