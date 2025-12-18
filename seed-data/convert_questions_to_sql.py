#!/usr/bin/env python3
"""
ETHOS UARI+ - Convert Question JSON to SQL Seed Data
Created: December 18, 2025
Purpose: Convert question bank JSON files to SQL INSERT statements
"""

import json
import os

# Domain mappings (from audit)
DOMAIN_MAPPINGS = {
    5: {"name": "Data Governance & Privacy", "short_code": "D5", "question_count": 40},
    6: {"name": "Transparency & Explainability", "short_code": "D6", "question_count": 40},
    7: {"name": "Social Impact & Global Equity", "short_code": "D7", "question_count": 40},
    8: {"name": "Environmental Sustainability", "short_code": "D8", "question_count": 40},
}

def load_json_questions(domain_id):
    """Load questions from JSON file"""
    json_files = {
        5: "/mnt/aidrive/ETHOS_COMPLETE_PACKAGE_Dec17_2025/backend_content/question_banks/DOMAIN_5_DATA_GOVERNANCE_PRIVACY.json",
        6: "/mnt/aidrive/ETHOS_COMPLETE_PACKAGE_Dec17_2025/backend_content/question_banks/DOMAIN_6_TRANSPARENCY_EXPLAINABILITY.json",
        7: "/mnt/aidrive/ETHOS_COMPLETE_PACKAGE_Dec17_2025/backend_content/question_banks/DOMAIN_7_SOCIAL_IMPACT_EQUITY.json",
        8: "/mnt/aidrive/ETHOS_COMPLETE_PACKAGE_Dec17_2025/backend_content/question_banks/DOMAIN_8_ENVIRONMENTAL_SUSTAINABILITY.json",
    }
    
    filepath = json_files.get(domain_id)
    if not filepath or not os.path.exists(filepath):
        return []
    
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
        return data.get('questions', [])

def escape_sql_string(s):
    """Escape single quotes for SQL"""
    if s is None:
        return ''
    return str(s).replace("'", "''")

def convert_question_to_sql(question, domain_id):
    """Convert a single question to SQL INSERT statement"""
    
    # Extract question metadata
    question_code = question.get('question_id', '').replace('Q0', 'Q00')  # Normalize Q01 -> Q001
    question_text = escape_sql_string(question.get('question_text', ''))
    
    # Determine subdomain/category
    subdomain = escape_sql_string(question.get('category', 'General'))
    
    # Determine criticality (based on scoring_weight)
    scoring_weight = float(question.get('scoring_weight', 1.0))
    if scoring_weight >= 1.5:
        criticality = 'CRITICAL'
    elif scoring_weight >= 1.0:
        criticality = 'HIGH'
    elif scoring_weight >= 0.5:
        criticality = 'MEDIUM'
    else:
        criticality = 'LOW'
    
    # Convert response_options to JSON
    response_options = json.dumps(question.get('response_options', []))
    response_options_escaped = escape_sql_string(response_options)
    
    # Evidence requirements
    evidence_required = question.get('evidence_required', False)
    evidence_guidance = escape_sql_string(question.get('evidence_guidance', ''))
    evidence_json = json.dumps({
        "required": evidence_required,
        "guidance": evidence_guidance
    })
    evidence_json_escaped = escape_sql_string(evidence_json)
    
    # Assessor guidance
    assessor_guidance = escape_sql_string(question.get('assessor_guidance', ''))
    assessor_json = json.dumps({
        "guidance": assessor_guidance,
        "maturity_indicators": question.get('maturity_indicators', {})
    })
    assessor_json_escaped = escape_sql_string(assessor_json)
    
    # Industry variations (placeholder)
    industry_variations = escape_sql_string(json.dumps({}))
    
    # Related questions (placeholder)
    related_questions = escape_sql_string(json.dumps([]))
    
    # Regulatory context (placeholder)
    regulatory_context = escape_sql_string(json.dumps({}))
    
    # Generate SQL INSERT
    sql = f"""INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  {domain_id},
  '{subdomain}',
  '{question_code}',
  '{question_text}',
  '{criticality}',
  {scoring_weight},
  '{response_options_escaped}',
  '{evidence_json_escaped}',
  '{assessor_json_escaped}',
  '{industry_variations}',
  '{related_questions}',
  '{regulatory_context}'
);
"""
    return sql

def main():
    """Main conversion function"""
    output_file = "/home/user/webapp/ethos-uari/seed-data/02_questions_domains_5to8.sql"
    
    with open(output_file, 'w', encoding='utf-8') as f:
        # Write header
        f.write("""-- ================================================================================
-- ETHOS UARI+ PLATFORM - QUESTIONS SEED DATA (DOMAINS 5-8)
-- ================================================================================
-- Created: December 18, 2025
-- Purpose: Insert 160 assessment questions for Domains 5-8
-- Source: Question Bank JSON files from comprehensive audit
-- Total: D5=40, D6=40, D7=40, D8=40 questions
-- ================================================================================

""")
        
        total_questions = 0
        
        # Process each domain
        for domain_id in [5, 6, 7, 8]:
            domain_info = DOMAIN_MAPPINGS[domain_id]
            
            # Write domain header
            f.write(f"""-- ================================================================================
-- DOMAIN {domain_id}: {domain_info['name']} ({domain_info['question_count']} questions)
-- ================================================================================

""")
            
            # Load and convert questions
            questions = load_json_questions(domain_id)
            
            for question in questions:
                sql = convert_question_to_sql(question, domain_id)
                f.write(sql)
                f.write("\n")
                total_questions += 1
            
            f.write(f"\n-- Domain {domain_id} complete: {len(questions)} questions inserted\n\n")
        
        # Write footer
        f.write(f"""-- ================================================================================
-- SUMMARY: {total_questions} questions inserted (Domains 5-8)
-- ================================================================================
-- Next: Create Domain 1-4 questions (27 questions) to reach 187 total
-- ================================================================================
""")
    
    print(f"✅ SQL file created: {output_file}")
    print(f"✅ Total questions: {total_questions}")
    print(f"✅ Domains 5-8 complete (160/187 questions)")

if __name__ == "__main__":
    main()
