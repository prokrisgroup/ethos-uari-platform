#!/usr/bin/env python3
"""
ETHOS UARI+ - Extract ALL 187 Questions from Markdown Files
Created: December 18, 2025
Purpose: Parse DOMAIN_X_ALL_40_QUESTIONS_COMPLETE.md files to extract all 160 questions (D5-D8)
         Then extract 27 questions for D1-D4 from PHASE1 specifications
"""

import re
import json

# Domain mappings
DOMAIN_INFO = {
    5: {"name": "Data Governance & Privacy", "short_code": "D5", "target_questions": 40},
    6: {"name": "Transparency & Explainability", "short_code": "D6", "target_questions": 40},
    7: {"name": "Social Impact & Global Equity", "short_code": "D7", "target_questions": 40},
    8: {"name": "Environmental Sustainability", "short_code": "D8", "target_questions": 40},
}

def parse_markdown_question(question_text, domain_id):
    """Parse a single question block from markdown"""
    lines = question_text.strip().split('\n')
    
    question_data = {
        'domain_id': domain_id,
        'question_code': '',
        'question_text': '',
        'response_options': [],
        'evidence_required': False,
        'evidence_guidance': '',
        'assessor_guidance': '',
        'scoring_weight': 1.0,
        'category': '',
        'maturity_indicators': {}
    }
    
    current_section = None
    maturity_level = None
    
    for line in lines:
        line = line.strip()
        
        # Extract question number from header
        if line.startswith('###') and 'Q' in line:
            # Extract Q number (e.g., "### **Q01: Data Governance Policy**")
            match = re.search(r'Q(\d+):', line)
            if match:
                q_num = match.group(1)
                question_data['question_code'] = f"D{domain_id}-Q{q_num}"
                # Extract category from title
                category_match = re.search(r'Q\d+:\s*(.+)\*\*', line)
                if category_match:
                    question_data['category'] = category_match.group(1).strip()
        
        # Question text
        elif line.startswith('**Question:**'):
            question_data['question_text'] = line.replace('**Question:**', '').strip()
        
        # Response options
        elif re.match(r'^\d+\.', line) and 'Score:' in line:
            # Parse response option: "1. No data governance policy exists (Score: 1.0, Level 1)"
            match = re.match(r'^(\d+)\.\s*(.+?)\s*\(Score:\s*([\d.]+),\s*Level\s*(\d+)\)', line)
            if match:
                value, label, score, level = match.groups()
                question_data['response_options'].append({
                    'value': int(value),
                    'label': label.strip(),
                    'score': float(score),
                    'maturity_level': int(level)
                })
        
        # Evidence required
        elif line.startswith('**Evidence Required:**'):
            question_data['evidence_required'] = 'Yes' in line
        
        # Evidence guidance
        elif line.startswith('**Evidence Guidance:**'):
            question_data['evidence_guidance'] = line.replace('**Evidence Guidance:**', '').strip()
        
        # Assessor guidance
        elif line.startswith('**Assessor Guidance:**'):
            question_data['assessor_guidance'] = line.replace('**Assessor Guidance:**', '').strip()
        
        # Scoring weight
        elif line.startswith('**Scoring Weight:**'):
            weight_str = line.replace('**Scoring Weight:**', '').strip()
            try:
                question_data['scoring_weight'] = float(weight_str)
            except:
                question_data['scoring_weight'] = 1.0
        
        # Category
        elif line.startswith('**Category:**'):
            question_data['category'] = line.replace('**Category:**', '').strip()
        
        # Maturity indicators
        elif line.startswith('- Level'):
            match = re.match(r'-\s*Level\s*(\d+):\s*(.+)', line)
            if match:
                level, description = match.groups()
                question_data['maturity_indicators'][f'level_{level}'] = description.strip()
    
    return question_data

def parse_domain_markdown(domain_id):
    """Parse complete domain markdown file"""
    filepath = f"/mnt/aidrive/ETHOS_COMPLETE_PACKAGE_Dec17_2025/backend_content/question_banks/DOMAIN_{domain_id}_ALL_40_QUESTIONS_COMPLETE.md"
    
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"⚠️  File not found: {filepath}")
        return []
    
    # Split by question headers (### **Q)
    question_blocks = re.split(r'\n### \*\*Q', content)
    
    questions = []
    for i, block in enumerate(question_blocks[1:], 1):  # Skip header block
        # Add back the header marker
        block = '### **Q' + block
        question_data = parse_markdown_question(block, domain_id)
        
        if question_data['question_code']:
            questions.append(question_data)
    
    return questions

def escape_sql_string(s):
    """Escape single quotes for SQL"""
    if s is None:
        return ''
    return str(s).replace("'", "''")

def generate_sql_insert(question):
    """Generate SQL INSERT statement for a question"""
    
    # Determine criticality based on scoring weight
    scoring_weight = question['scoring_weight']
    if scoring_weight >= 1.5:
        criticality = 'CRITICAL'
    elif scoring_weight >= 1.0:
        criticality = 'HIGH'
    elif scoring_weight >= 0.5:
        criticality = 'MEDIUM'
    else:
        criticality = 'LOW'
    
    # Prepare JSON fields
    response_options = escape_sql_string(json.dumps(question['response_options']))
    
    evidence_json = json.dumps({
        "required": question['evidence_required'],
        "guidance": question['evidence_guidance']
    })
    evidence_json_escaped = escape_sql_string(evidence_json)
    
    assessor_json = json.dumps({
        "guidance": question['assessor_guidance'],
        "maturity_indicators": question['maturity_indicators']
    })
    assessor_json_escaped = escape_sql_string(assessor_json)
    
    # SQL statement
    sql = f"""INSERT INTO questions (
  domain_id, subdomain, question_code, question_text, criticality, scoring_weight,
  response_options, evidence_requirements, assessor_guidance, 
  industry_variations, related_questions, regulatory_context
) VALUES (
  {question['domain_id']},
  '{escape_sql_string(question['category'])}',
  '{question['question_code']}',
  '{escape_sql_string(question['question_text'])}',
  '{criticality}',
  {question['scoring_weight']},
  '{response_options}',
  '{evidence_json_escaped}',
  '{assessor_json_escaped}',
  '{{}}',
  '[]',
  '{{}}'
);
"""
    return sql

def main():
    """Main extraction function"""
    print("=" * 80)
    print("ETHOS UARI+ - Extracting ALL 160 Questions from Domains 5-8")
    print("=" * 80)
    
    all_questions = []
    
    # Extract questions from Domains 5-8
    for domain_id in [5, 6, 7, 8]:
        print(f"\n📋 Processing Domain {domain_id}: {DOMAIN_INFO[domain_id]['name']}")
        questions = parse_domain_markdown(domain_id)
        print(f"   ✅ Extracted {len(questions)} questions")
        all_questions.extend(questions)
        
        if len(questions) != 40:
            print(f"   ⚠️  WARNING: Expected 40 questions, got {len(questions)}")
    
    print(f"\n{'=' * 80}")
    print(f"TOTAL EXTRACTED: {len(all_questions)} questions")
    print(f"{'=' * 80}")
    
    # Generate SQL file
    output_file = "/home/user/webapp/ethos-uari/seed-data/02_questions_ALL_160_domains_5to8.sql"
    
    with open(output_file, 'w', encoding='utf-8') as f:
        # Header
        f.write("""-- ================================================================================
-- ETHOS UARI+ PLATFORM - ALL 160 QUESTIONS (DOMAINS 5-8)
-- ================================================================================
-- Created: December 18, 2025
-- Purpose: Insert ALL 160 assessment questions for Domains 5-8
-- Source: DOMAIN_X_ALL_40_QUESTIONS_COMPLETE.md files from comprehensive audit
-- Extracted: Complete structured questions with full metadata
-- Total: D5=40, D6=40, D7=40, D8=40 questions
-- ================================================================================

""")
        
        # Process each domain
        current_domain = None
        for question in all_questions:
            if question['domain_id'] != current_domain:
                current_domain = question['domain_id']
                domain_info = DOMAIN_INFO[current_domain]
                f.write(f"""-- ================================================================================
-- DOMAIN {current_domain}: {domain_info['name']} (40 questions)
-- ================================================================================

""")
            
            sql = generate_sql_insert(question)
            f.write(sql)
            f.write("\n")
        
        # Footer
        f.write(f"""-- ================================================================================
-- SUMMARY: {len(all_questions)} questions inserted (Domains 5-8)
-- ================================================================================
-- Domain 5: {len([q for q in all_questions if q['domain_id'] == 5])} questions
-- Domain 6: {len([q for q in all_questions if q['domain_id'] == 6])} questions
-- Domain 7: {len([q for q in all_questions if q['domain_id'] == 7])} questions
-- Domain 8: {len([q for q in all_questions if q['domain_id'] == 8])} questions
-- ================================================================================
-- Next: Extract Domains 1-4 questions (27 questions) to reach 187 total
-- ================================================================================
""")
    
    print(f"\n✅ SQL file created: {output_file}")
    print(f"✅ Total questions: {len(all_questions)}")
    
    # Breakdown by domain
    for domain_id in [5, 6, 7, 8]:
        count = len([q for q in all_questions if q['domain_id'] == domain_id])
        print(f"   Domain {domain_id}: {count} questions")
    
    return len(all_questions)

if __name__ == "__main__":
    total = main()
    print(f"\n{'=' * 80}")
    print(f"✅ EXTRACTION COMPLETE: {total}/160 questions for Domains 5-8")
    print(f"⏳ NEXT: Extract 27 questions for Domains 1-4 to reach 187 total")
    print(f"{'=' * 80}")
