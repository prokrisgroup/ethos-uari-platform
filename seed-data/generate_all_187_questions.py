#!/usr/bin/env python3
"""
ETHOS UARI+ - Generate ALL 187 Questions with Full Detail
Created: December 18, 2025
Purpose: Generate complete SQL for all 187 questions based on audit framework
Strategy: Use detailed examples as templates, apply to all question themes
"""

import json

def escape_sql(s):
    """Escape single quotes for SQL"""
    return str(s).replace("'", "''") if s else ''

def generate_question_sql(domain_id, q_num, title, question_text, category, 
                          weight=1.0, evidence_req=True, level_1_label="", 
                          level_5_label=""):
    """Generate a complete question SQL INSERT"""
    
    q_code = f"D{domain_id}-Q{q_num:03d}"
    criticality = "CRITICAL" if weight >= 1.5 else "HIGH" if weight >= 1.0 else "MEDIUM"
    
    # Generate response options based on level labels
    response_opts = [
        {"value": 1, "label": level_1_label or f"No {title.lower()} in place", "score": 1.0, "maturity_level": 1},
        {"value": 2, "label": f"Basic {title.lower()} in early stages", "score": 2.0, "maturity_level": 2},
        {"value": 3, "label": f"{title} exists but inconsistently applied", "score": 3.0, "maturity_level": 3},
        {"value": 4, "label": f"Comprehensive {title.lower()} with good enforcement", "score": 4.0, "maturity_level": 4},
        {"value": 5, "label": level_5_label or f"Industry-leading {title.lower()} with continuous improvement", "score": 5.0, "maturity_level": 5}
    ]
    
    evidence_guidance = f"Provide documentation, implementation evidence, metrics, and examples demonstrating {title.lower()} maturity."
    assessor_guidance = f"Evaluate: 1) Comprehensiveness, 2) Implementation quality, 3) Enforcement mechanisms, 4) Continuous improvement, 5) Alignment with best practices."
    
    maturity_indicators = {
        "level_1": f"No formal {title.lower()}; ad hoc approach",
        "level_2": f"Basic {title.lower()} in development",
        "level_3": f"{title} exists but gaps remain",
        "level_4": f"Comprehensive {title.lower()} well-implemented",
        "level_5": f"Industry-leading {title.lower()} with innovation"
    }
    
    sql = f"""INSERT INTO questions (domain_id, subdomain, question_code, question_text, criticality, scoring_weight, response_options, evidence_requirements, assessor_guidance, industry_variations, related_questions, regulatory_context)
VALUES ({domain_id}, '{escape_sql(category)}', '{q_code}', '{escape_sql(question_text)}', '{criticality}', {weight}, '{escape_sql(json.dumps(response_opts))}', '{escape_sql(json.dumps({"required": evidence_req, "guidance": evidence_guidance}))}', '{escape_sql(json.dumps({"guidance": assessor_guidance, "maturity_indicators": maturity_indicators}))}', '{{}}', '[]', '{{}}');

"""
    return sql

# Domain 5: Data Governance & Privacy (40 questions)
D5_QUESTIONS = [
    (1, "Data Governance Policy", "Does your organization have a comprehensive data governance policy that specifically addresses AI systems?", "Policy Framework", 1.5, True),
    (2, "Data Classification", "Are data classification frameworks in place that categorize AI training data, model data, and inference data?", "Data Classification", 1.0, True),
    (3, "Data Retention & Deletion", "Do you have documented data retention and deletion policies specifically for AI systems?", "Data Lifecycle", 1.0, True),
    (4, "Privacy Impact Assessments", "Are privacy impact assessments (PIAs) or data protection impact assessments (DPIAs) conducted for all AI systems processing personal data?", "Privacy Assessment", 1.5, True),
    (5, "Data Subject Rights", "Do you have mechanisms in place to honor data subject rights (access, rectification, erasure, portability) for data used in AI systems?", "Data Subject Rights", 1.5, True),
    # Q06-Q10: Data Lifecycle Management
    (6, "Data Collection Consent", "Is explicit informed consent obtained for all data collection used in AI training and operation?", "Data Lifecycle", 1.5, True),
    (7, "Data Quality Assurance", "Are data quality assurance processes in place for AI system inputs and training data?", "Data Lifecycle", 1.0, True),
    (8, "Data Lineage Tracking", "Do you maintain comprehensive data lineage tracking for AI systems?", "Data Lifecycle", 1.0, True),
    (9, "Data Versioning", "Are data versioning controls implemented for AI training datasets and model inputs?", "Data Lifecycle", 1.0, True),
    (10, "Data Archival & Backup", "Do you have secure archival and backup procedures for AI system data?", "Data Lifecycle", 1.0, True),
    # Q11-Q15: Privacy Controls
    (11, "Privacy by Design", "Is privacy-by-design integrated into AI system development from inception?", "Privacy Controls", 1.5, True),
    (12, "Data Minimization", "Do you practice data minimization principles in AI system design and operation?", "Privacy Controls", 1.5, True),
    (13, "Purpose Limitation", "Are purpose limitation controls enforced for AI data processing activities?", "Privacy Controls", 1.0, True),
    (14, "Anonymization Techniques", "Do you employ robust anonymization or pseudonymization techniques for AI training data?", "Privacy Controls", 1.0, True),
    (15, "Differential Privacy", "Are differential privacy or similar privacy-preserving techniques used in AI systems?", "Privacy Controls", 1.0, True),
    # Q16-Q20: Consent Management
    (16, "Informed Consent Mechanisms", "Do you have clear, understandable informed consent mechanisms for AI data usage?", "Consent Management", 1.5, True),
    (17, "Consent Withdrawal", "Can data subjects easily withdraw consent for AI data processing?", "Consent Management", 1.5, True),
    (18, "Granular Consent Options", "Do you provide granular consent options for different AI processing purposes?", "Consent Management", 1.0, True),
    (19, "Consent Audit Trails", "Are comprehensive audit trails maintained for all consent decisions?", "Consent Management", 1.0, True),
    (20, "Re-consent Processes", "Do you have processes for obtaining re-consent when AI purposes change?", "Consent Management", 1.0, True),
    # Q21-Q25: Access Controls
    (21, "Role-Based Access Control", "Is role-based access control (RBAC) implemented for AI system data and models?", "Access Controls", 1.0, True),
    (22, "Least Privilege Principle", "Do you enforce least privilege principles for AI system access?", "Access Controls", 1.0, True),
    (23, "Access Logging", "Are all access attempts to AI data and systems comprehensively logged?", "Access Controls", 1.0, True),
    (24, "Access Reviews", "Do you conduct regular access reviews for AI systems and data?", "Access Controls", 1.0, True),
    (25, "Privileged Access Management", "Is privileged access to AI systems managed with enhanced controls?", "Access Controls", 1.0, True),
    # Q26-Q30: Data Security
    (26, "Encryption at Rest", "Is all AI system data encrypted at rest using industry-standard encryption?", "Data Security", 1.5, True),
    (27, "Encryption in Transit", "Is data encrypted in transit for all AI system communications?", "Data Security", 1.5, True),
    (28, "Key Management", "Do you have secure cryptographic key management for AI data encryption?", "Data Security", 1.0, True),
    (29, "Secure Data Disposal", "Are secure data disposal procedures in place for AI system data?", "Data Security", 1.0, True),
    (30, "Breach Response", "Do you have a data breach response plan specific to AI systems?", "Data Security", 1.5, True),
    # Q31-Q35: Cross-Border Data Flows
    (31, "Transfer Mechanisms", "Are appropriate legal mechanisms in place for cross-border AI data transfers?", "Cross-Border Flows", 1.5, True),
    (32, "Data Localization", "Do you comply with data localization requirements for AI systems?", "Cross-Border Flows", 1.0, True),
    (33, "Transfer Risk Assessments", "Are risk assessments conducted for cross-border AI data transfers?", "Cross-Border Flows", 1.0, True),
    (34, "Adequacy Determinations", "Do you verify adequacy determinations for international AI data transfers?", "Cross-Border Flows", 1.0, True),
    (35, "Data Sovereignty", "Do you respect data sovereignty requirements in AI system deployments?", "Cross-Border Flows", 1.0, True),
    # Q36-Q40: Vendor Management
    (36, "Processor Agreements", "Do you have data processing agreements with all AI system vendors?", "Vendor Management", 1.5, True),
    (37, "Vendor Security Assessments", "Are security assessments conducted for all AI vendors handling data?", "Vendor Management", 1.0, True),
    (38, "Audit Rights", "Do your vendor contracts include audit rights for AI data processing?", "Vendor Management", 1.0, True),
    (39, "Data Processing Addendums", "Are DPAs in place with all AI vendors processing personal data?", "Vendor Management", 1.0, True),
    (40, "Breach Notification", "Do vendor contracts include breach notification requirements for AI systems?", "Vendor Management", 1.0, True),
]

# Generate SQL file
def main():
    print("="*80)
    print("GENERATING ALL 187 QUESTIONS - DOMAIN 5: DATA GOVERNANCE & PRIVACY")
    print("="*80)
    
    output_file = "/home/user/webapp/ethos-uari/seed-data/DOMAIN_5_ALL_40_COMPLETE.sql"
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("""-- ================================================================================
-- DOMAIN 5: DATA GOVERNANCE & PRIVACY - ALL 40 QUESTIONS
-- ================================================================================
-- Generated: December 18, 2025
-- Complete: 40 questions with full metadata
-- ================================================================================

""")
        
        for q_data in D5_QUESTIONS:
            sql = generate_question_sql(5, *q_data)
            f.write(sql)
        
        f.write("""-- ================================================================================
-- DOMAIN 5 COMPLETE: 40/40 questions
-- ================================================================================
""")
    
    print(f"✅ Generated {len(D5_QUESTIONS)} questions for Domain 5")
    print(f"✅ File: {output_file}")
    print(f"\n⏳ Next: Generate Domains 6, 7, 8 (120 more questions)")
    print(f"⏳ Then: Generate Domains 1-4 (27 more questions)")
    print(f"⏳ Total target: 187 questions")

if __name__ == "__main__":
    main()
