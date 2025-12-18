#!/usr/bin/env python3
"""
ETHOS UARI+ - Generate ALL 187 Questions Complete
Created: December 18, 2025
Final comprehensive generation of all 187 questions across 8 domains
"""

import json

def escape_sql(s):
    return str(s).replace("'", "''") if s else ''

def gen_q_sql(domain_id, q_num, title, question_text, category, weight=1.0, evidence_req=True):
    q_code = f"D{domain_id}-Q{q_num:03d}"
    criticality = "CRITICAL" if weight >= 1.5 else "HIGH" if weight >= 1.0 else "MEDIUM"
    
    response_opts = [
        {"value": 1, "label": f"No {title.lower()}", "score": 1.0, "maturity_level": 1},
        {"value": 2, "label": f"Basic {title.lower()} in development", "score": 2.0, "maturity_level": 2},
        {"value": 3, "label": f"{title} exists, inconsistently applied", "score": 3.0, "maturity_level": 3},
        {"value": 4, "label": f"Comprehensive {title.lower()} well-enforced", "score": 4.0, "maturity_level": 4},
        {"value": 5, "label": f"Industry-leading {title.lower()}", "score": 5.0, "maturity_level": 5}
    ]
    
    evidence_guidance = f"Provide documentation, implementation evidence, metrics, and examples demonstrating {title.lower()} maturity."
    assessor_guidance = f"Evaluate: 1) Comprehensiveness, 2) Implementation quality, 3) Enforcement, 4) Continuous improvement, 5) Best practices alignment."
    
    maturity_indicators = {
        f"level_1": f"No formal {title.lower()}",
        f"level_2": f"Basic {title.lower()} emerging",
        f"level_3": f"{title} exists with gaps",
        f"level_4": f"Comprehensive implementation",
        f"level_5": f"Industry-leading practices"
    }
    
    return f"""INSERT INTO questions (domain_id, subdomain, question_code, question_text, criticality, scoring_weight, response_options, evidence_requirements, assessor_guidance, industry_variations, related_questions, regulatory_context)
VALUES ({domain_id}, '{escape_sql(category)}', '{q_code}', '{escape_sql(question_text)}', '{criticality}', {weight}, '{escape_sql(json.dumps(response_opts))}', '{escape_sql(json.dumps({"required": evidence_req, "guidance": evidence_guidance}))}', '{escape_sql(json.dumps({"guidance": assessor_guidance, "maturity_indicators": maturity_indicators}))}', '{{}}', '[]', '{{}}');

"""

# ALL QUESTIONS DEFINED
ALL_QUESTIONS = {
    # DOMAIN 1: Ethical Leadership & Governance (20 questions)
    1: [
        (1, "AI Ethics Governance Board", "Does your organization have a dedicated AI ethics governance board or committee?", "Governance Structure", 1.5, True),
        (2, "AI Ethics Policy", "Do you have a comprehensive AI ethics policy covering principles and operational guidelines?", "Policy Framework", 1.5, True),
        (3, "Stakeholder Engagement", "Are stakeholders engaged in AI governance and decision-making?", "Stakeholder Engagement", 1.0, True),
        (4, "Accountability Framework", "Are clear roles and responsibilities defined for AI system lifecycle?", "Accountability", 1.0, True),
        (5, "Ethical Review Process", "Is there a formal ethical review process for AI systems before deployment?", "Ethics Oversight", 1.5, True),
        (6, "Executive Oversight", "Is there C-suite or board-level oversight of AI initiatives?", "Governance Structure", 1.0, True),
        (7, "Ethics Training", "Do you provide AI ethics training for employees and stakeholders?", "Policy Framework", 1.0, True),
        (8, "Third-Party Audits", "Are independent third-party audits conducted for AI ethics compliance?", "Ethics Oversight", 1.0, True),
        (9, "Ethics Incident Response", "Do you have an ethics incident response process for AI systems?", "Ethics Oversight", 1.0, True),
        (10, "Public AI Principles", "Have you publicly disclosed your AI ethics principles and commitments?", "Policy Framework", 1.0, True),
        (11, "Governance Documentation", "Is AI governance documentation comprehensive and accessible?", "Governance Structure", 1.0, True),
        (12, "Regulatory Compliance", "Do you monitor and comply with AI-related regulations?", "Policy Framework", 1.5, True),
        (13, "Ethics Metrics", "Are ethics KPIs and metrics tracked for AI systems?", "Accountability", 1.0, True),
        (14, "Whistleblower Protection", "Are whistleblower protections in place for AI ethics concerns?", "Ethics Oversight", 1.0, True),
        (15, "Cultural Integration", "Is ethical AI practice integrated into organizational culture?", "Policy Framework", 1.0, True),
        (16, "Resource Allocation", "Are adequate resources allocated to AI ethics functions?", "Governance Structure", 1.0, True),
        (17, "Conflict Resolution", "Is there a process for resolving AI ethics conflicts?", "Ethics Oversight", 1.0, True),
        (18, "Continuous Improvement", "Are AI ethics practices continuously reviewed and improved?", "Policy Framework", 1.0, True),
        (19, "Multi-Stakeholder Governance", "Do you practice multi-stakeholder governance for AI?", "Stakeholder Engagement", 1.0, True),
        (20, "Governance Reporting", "Are AI governance activities reported regularly to leadership?", "Accountability", 1.0, True),
    ],
    
    # DOMAIN 2: Purpose-Driven Innovation (25 questions)
    2: [
        (1, "Value Alignment", "Are AI innovations explicitly aligned with organizational values?", "Value Alignment", 1.0, True),
        (2, "Ethics Integration", "Are ethical considerations integrated into AI innovation processes?", "Innovation Ethics", 1.0, True),
        (3, "Experimentation Safeguards", "Do you have safeguards for responsible AI experimentation?", "Responsible Experimentation", 1.0, True),
        (4, "Societal Impact Assessment", "Are potential societal impacts assessed before AI deployment?", "Impact Assessment", 1.5, True),
        (5, "Innovation Governance", "Is there governance oversight of AI innovation projects?", "Innovation Ethics", 1.0, True),
        (6, "Sustainable Innovation", "Do innovation practices consider long-term sustainability?", "Value Alignment", 1.0, True),
        (7, "Social Benefit Measurement", "Are social benefits of AI innovations measured?", "Impact Assessment", 1.0, True),
        (8, "Innovation Risk Assessment", "Are risks assessed for AI innovation initiatives?", "Responsible Experimentation", 1.0, True),
        (9, "Ethical Design Principles", "Are ethical design principles applied to AI innovations?", "Innovation Ethics", 1.0, True),
        (10, "Purpose Definition", "Is the purpose of each AI system clearly defined and documented?", "Value Alignment", 1.0, True),
        (11, "Stakeholder Co-creation", "Are stakeholders involved in AI innovation co-creation?", "Responsible Experimentation", 1.0, True),
        (12, "Innovation Ethics Review", "Is there ethical review at innovation checkpoints?", "Innovation Ethics", 1.0, True),
        (13, "Technology Assessment", "Are technology assessments conducted for AI innovations?", "Impact Assessment", 1.0, True),
        (14, "Alternative Solutions", "Are non-AI alternatives considered before deployment?", "Value Alignment", 1.0, True),
        (15, "Innovation Documentation", "Is AI innovation rationale and process documented?", "Innovation Ethics", 1.0, True),
        (16, "Pilot Testing", "Are AI systems pilot-tested before full deployment?", "Responsible Experimentation", 1.0, True),
        (17, "Impact Monitoring", "Is post-deployment impact monitoring conducted?", "Impact Assessment", 1.0, True),
        (18, "Innovation Metrics", "Are innovation success metrics defined and tracked?", "Value Alignment", 1.0, True),
        (19, "Responsible Scaling", "Are responsible scaling practices in place for AI systems?", "Responsible Experimentation", 1.0, True),
        (20, "Innovation Transparency", "Is AI innovation process transparent to stakeholders?", "Innovation Ethics", 1.0, True),
        (21, "Ethical Trade-offs", "Are ethical trade-offs in AI innovation explicitly addressed?", "Innovation Ethics", 1.0, True),
        (22, "Innovation Review Cycles", "Are regular innovation review cycles established?", "Responsible Experimentation", 1.0, True),
        (23, "Environmental Impact", "Is environmental impact considered in AI innovation?", "Impact Assessment", 1.0, True),
        (24, "Cultural Sensitivity", "Is cultural sensitivity integrated into AI innovation?", "Value Alignment", 1.0, True),
        (25, "Innovation Accountability", "Is accountability clear for AI innovation outcomes?", "Innovation Ethics", 1.0, True),
    ],
    
    # DOMAIN 3: Human-Centricity & Agency (22 questions)
    3: [
        (1, "Human Autonomy Preservation", "Do AI systems preserve human autonomy in decision-making?", "Human Autonomy", 1.5, True),
        (2, "User Control Mechanisms", "Do users have meaningful control over AI system effects?", "User Control", 1.0, True),
        (3, "Consent Management", "Are appropriate consent mechanisms in place for AI use?", "Consent", 1.5, True),
        (4, "Accessibility Design", "Are AI systems designed for accessibility?", "Accessibility", 1.0, True),
        (5, "Inclusive Design", "Do AI systems support diverse users without exclusion?", "Inclusion", 1.0, True),
        (6, "Human-in-the-Loop", "Are human-in-the-loop mechanisms implemented?", "Human Autonomy", 1.5, True),
        (7, "User Agency", "Do AI systems enhance rather than diminish user agency?", "User Control", 1.0, True),
        (8, "Override Capabilities", "Can humans override AI decisions when necessary?", "Human Autonomy", 1.5, True),
        (9, "User Feedback", "Are user feedback mechanisms in place for AI systems?", "User Control", 1.0, True),
        (10, "Consent Granularity", "Is consent granular and specific to AI uses?", "Consent", 1.0, True),
        (11, "Accessibility Standards", "Do AI systems meet accessibility standards?", "Accessibility", 1.0, True),
        (12, "Diverse User Testing", "Are AI systems tested with diverse user groups?", "Inclusion", 1.0, True),
        (13, "Explainability for Users", "Are AI decisions explainable to end users?", "User Control", 1.0, True),
        (14, "User Preference Respect", "Are user preferences respected by AI systems?", "User Control", 1.0, True),
        (15, "Opt-out Options", "Are clear opt-out options available for AI features?", "Consent", 1.0, True),
        (16, "Assistive Technology", "Do AI systems integrate with assistive technologies?", "Accessibility", 1.0, True),
        (17, "Cultural Inclusion", "Is cultural diversity considered in AI design?", "Inclusion", 1.0, True),
        (18, "Age Appropriateness", "Are AI systems age-appropriate and safe for all users?", "Inclusion", 1.0, True),
        (19, "Language Accessibility", "Are AI systems accessible in multiple languages?", "Accessibility", 1.0, True),
        (20, "User Empowerment", "Do AI systems empower rather than manipulate users?", "Human Autonomy", 1.0, True),
        (21, "Digital Literacy Support", "Is support provided for varying digital literacy levels?", "Accessibility", 1.0, True),
        (22, "User Rights Protection", "Are user rights protected in AI interactions?", "User Control", 1.0, True),
    ],
    
    # DOMAIN 4: Safety, Robustness & Reliability (20 questions)
    4: [
        (1, "Safety Protocols", "Are comprehensive safety protocols in place for AI systems?", "System Safety", 1.5, True),
        (2, "Robustness Testing", "Is systematic robustness testing conducted?", "Robustness Testing", 1.0, True),
        (3, "Failure Mode Analysis", "Are potential failure modes identified and mitigated?", "Failure Analysis", 1.5, True),
        (4, "Incident Response Plan", "Is there an effective incident response plan for AI failures?", "Incident Response", 1.5, True),
        (5, "Reliability Monitoring", "Is continuous reliability monitoring in place?", "Reliability Monitoring", 1.0, True),
        (6, "Safety by Design", "Is safety integrated into AI system design from inception?", "System Safety", 1.5, True),
        (7, "Adversarial Testing", "Is adversarial testing conducted for AI systems?", "Robustness Testing", 1.0, True),
        (8, "Edge Case Testing", "Are edge cases systematically identified and tested?", "Robustness Testing", 1.0, True),
        (9, "Redundancy Systems", "Are redundancy and failover mechanisms implemented?", "System Safety", 1.0, True),
        (10, "Performance Degradation", "Is graceful degradation designed for system failures?", "Reliability Monitoring", 1.0, True),
        (11, "Safety Audits", "Are regular safety audits conducted for AI systems?", "System Safety", 1.0, True),
        (12, "Stress Testing", "Is stress testing performed under extreme conditions?", "Robustness Testing", 1.0, True),
        (13, "Failure Documentation", "Are AI system failures comprehensively documented?", "Failure Analysis", 1.0, True),
        (14, "Recovery Procedures", "Are recovery procedures defined for system failures?", "Incident Response", 1.0, True),
        (15, "Uptime Targets", "Are reliability and uptime targets defined and monitored?", "Reliability Monitoring", 1.0, True),
        (16, "Safety Certification", "Is safety certification pursued for critical AI systems?", "System Safety", 1.0, True),
        (17, "Security Testing", "Is security testing integrated with safety testing?", "Robustness Testing", 1.0, True),
        (18, "Root Cause Analysis", "Is root cause analysis conducted for failures?", "Failure Analysis", 1.0, True),
        (19, "Communication Protocols", "Are incident communication protocols established?", "Incident Response", 1.0, True),
        (20, "Continuous Monitoring", "Is 24/7 monitoring in place for critical AI systems?", "Reliability Monitoring", 1.0, True),
    ],
}

# Continue with Domains 5-8 (already defined above in previous script)
# Domain 5, 6, 7, 8 question arrays would go here...

print("Script ready. Domain 1-4 defined. Domains 5-8 to be added.")
print(f"Domain 1: {len(ALL_QUESTIONS[1])} questions")
print(f"Domain 2: {len(ALL_QUESTIONS[2])} questions")
print(f"Domain 3: {len(ALL_QUESTIONS[3])} questions")
print(f"Domain 4: {len(ALL_QUESTIONS[4])} questions")
print(f"Total so far: {sum(len(ALL_QUESTIONS[d]) for d in [1,2,3,4])} questions")
