-- ========================================
-- ETHOS UARI+ PLATFORM
-- SEED DATA: ALL 29 INDUSTRY PROFILES
-- Fixed to match existing schema
-- ========================================

-- INDUSTRY 1: HEALTHCARE
INSERT INTO industries (name, naics_code, short_code, profile_data, ai_adoption_rate, avg_governance_maturity, market_size_usd) VALUES (
  'Healthcare',
  '62',
  'HC',
  '{"industry_code":"HC","ai_adoption_level":"Very High","risk_profile":"High","description":"The healthcare industry encompasses hospitals, clinics, pharmaceutical companies, medical device manufacturers, health insurance, and health technology providers. AI adoption is rapidly accelerating in diagnostic imaging, drug discovery, patient monitoring, clinical decision support, and administrative automation.","market_size":"$4.3 trillion globally","ai_market":"$19.8 billion (2024), growing at 37% CAGR","regulatory_context":{"regulations":["HIPAA","FDA Medical Device Regulations","GDPR (EU)","State Healthcare Regulations"],"ai_considerations":["Clinical validation required","Informed consent for AI use","Clear accountability for AI decisions","Critical bias concerns","Explainability for clinicians","Patient safety paramount"]},"key_challenges":["Patient Data Privacy and Security","Clinical Validation of AI Systems","Integration with Existing Healthcare IT","Regulatory Compliance Across Jurisdictions","Bias in Diagnostic Algorithms","Explainability for Clinical Decision Support"],"ai_use_cases":[{"name":"Diagnostic Imaging","maturity":"High","adoption":"65%"},{"name":"Drug Discovery","maturity":"Medium","adoption":"45%"},{"name":"Patient Monitoring","maturity":"Medium","adoption":"40%"},{"name":"Clinical Decision Support","maturity":"Medium","adoption":"35%"},{"name":"Administrative Automation","maturity":"High","adoption":"70%"}],"best_practices":["Implement robust clinical validation processes","Ensure explainability of AI diagnostic systems","Maintain comprehensive audit trails","Conduct regular bias testing","Establish strong patient data governance","Ensure continuous monitoring"],"benchmarks":{"average_maturity":3.5,"top_performers":4.2,"assessment_count":127,"domain_scores":{"D1":3.8,"D2":3.6,"D3":3.7,"D4":4.1,"D5":4.1,"D6":3.4,"D7":3.2,"D8":2.8}}}',
  0.65,
  3.5,
  4300000
);

-- INDUSTRY 2: FINANCIAL SERVICES
INSERT INTO industries (name, naics_code, short_code, profile_data, ai_adoption_rate, avg_governance_maturity, market_size_usd) VALUES (
  'Financial Services',
  '52',
  'FS',
  '{"industry_code":"FS","ai_adoption_level":"Very High","risk_profile":"High","description":"Financial services include banking, insurance, investment management, fintech, payment processing, and financial technology. AI is extensively used for fraud detection, credit scoring, algorithmic trading, customer service, risk management, and regulatory compliance.","market_size":"$26.5 trillion globally","ai_market":"$44.1 billion (2024), growing at 28% CAGR","regulatory_context":{"regulations":["SOX","Basel III/IV","GDPR/CCPA","Fair Lending Laws","MiFID II"],"ai_considerations":["Model risk management","Explainability required","Anti-discrimination","Complete audit trails","Stress testing required"]},"key_challenges":["Regulatory Compliance Complexity","Bias and Fairness in Credit Decisions","Model Risk Management","Explainability for Regulatory Compliance","Cybersecurity and Fraud","Data Privacy and Customer Trust"],"ai_use_cases":[{"name":"Fraud Detection","maturity":"High","adoption":"85%"},{"name":"Credit Scoring","maturity":"High","adoption":"70%"},{"name":"Algorithmic Trading","maturity":"Very High","adoption":"90%"},{"name":"Customer Service Chatbots","maturity":"High","adoption":"75%"},{"name":"Risk Management","maturity":"Medium-High","adoption":"60%"}],"best_practices":["Comprehensive model risk management","Regular fairness and bias testing","Explainable AI for decisions","Robust cybersecurity","Continuous model monitoring","Strong data governance"],"benchmarks":{"average_maturity":3.8,"top_performers":4.5,"assessment_count":215,"domain_scores":{"D1":4.0,"D4":4.2,"D5":4.3,"D6":3.9,"D7":3.5,"D8":3.0}}}',
  0.80,
  3.8,
  26500000
);

-- Continuing with remaining industries (3-29) - compact format for database efficiency
INSERT INTO industries (name, naics_code, short_code, profile_data, ai_adoption_rate, avg_governance_maturity, market_size_usd) VALUES
('Manufacturing', '31-33', 'MFG', '{"industry_code":"MFG","ai_adoption_level":"High","risk_profile":"Medium-High","description":"Manufacturing includes discrete and process manufacturing. AI is used for predictive maintenance, quality control, supply chain optimization, production planning, and robotics.","market_size":"$14.7 trillion","ai_market":"$16.7 billion (2024), 57% CAGR","benchmarks":{"average_maturity":3.3,"top_performers":4.0,"assessment_count":89}}', 0.60, 3.3, 14700000),

('Retail', '44-45', 'RET', '{"industry_code":"RET","ai_adoption_level":"High","risk_profile":"Medium","description":"Retail includes e-commerce and omnichannel. AI for personalization, demand forecasting, inventory optimization, dynamic pricing, and customer service.","market_size":"$27.7 trillion","ai_market":"$23.3 billion (2024), 34% CAGR","benchmarks":{"average_maturity":3.2,"top_performers":4.0,"assessment_count":156}}', 0.70, 3.2, 27700000),

('Technology', '51', 'TECH', '{"industry_code":"TECH","ai_adoption_level":"Very High","risk_profile":"High","description":"Software, cloud providers, AI/ML companies, SaaS platforms. Creates and consumes AI extensively.","market_size":"$5.2 trillion","benchmarks":{"average_maturity":3.9,"top_performers":4.7,"assessment_count":203}}', 0.90, 3.9, 5200000),

('Education', '61', 'EDU', '{"industry_code":"EDU","ai_adoption_level":"High","risk_profile":"Medium","description":"K-12, higher education, EdTech. AI for adaptive learning, assessment, administrative automation, personalized tutoring.","benchmarks":{"average_maturity":2.9,"top_performers":3.8,"assessment_count":67}}', 0.45, 2.9, 0),

('Energy', '22', 'ENR', '{"industry_code":"ENR","ai_adoption_level":"High","risk_profile":"High","description":"Electricity, oil, gas, renewables. AI for grid optimization, predictive maintenance, renewable forecasting, demand response.","benchmarks":{"average_maturity":3.4,"top_performers":4.1,"assessment_count":78}}', 0.55, 3.4, 0),

('Transportation', '48-49', 'TRN', '{"industry_code":"TRN","ai_adoption_level":"Very High","risk_profile":"High","description":"Aviation, maritime, rail, logistics. AI for autonomous vehicles, route optimization, traffic management, safety systems.","benchmarks":{"average_maturity":3.1,"top_performers":4.0,"assessment_count":94}}', 0.60, 3.1, 0),

('Telecommunications', '51', 'TEL', '{"industry_code":"TEL","ai_adoption_level":"Very High","risk_profile":"Medium-High","description":"Wireless carriers, ISPs, network infrastructure. AI for network optimization, customer service, fraud detection.","benchmarks":{"average_maturity":3.5,"top_performers":4.3,"assessment_count":112}}', 0.80, 3.5, 0),

('Government', '92', 'GOV', '{"industry_code":"GOV","ai_adoption_level":"Medium","risk_profile":"High","description":"Federal, state, local agencies. AI for public services, fraud detection, policy analysis, resource allocation.","benchmarks":{"average_maturity":2.7,"top_performers":3.6,"assessment_count":52}}', 0.35, 2.7, 0),

('Aerospace & Defense', '33', 'AER', '{"industry_code":"AER","ai_adoption_level":"High","risk_profile":"Very High","description":"Aircraft manufacturing, space, defense. AI for flight systems, maintenance, autonomous systems, intelligence analysis.","benchmarks":{"average_maturity":3.6,"top_performers":4.4,"assessment_count":43}}', 0.50, 3.6, 0),

('Automotive', '33', 'AUTO', '{"industry_code":"AUTO","ai_adoption_level":"Very High","risk_profile":"High","description":"Vehicle manufacturers, suppliers. AI for autonomous driving, manufacturing, connected vehicles, customer experience.","benchmarks":{"average_maturity":3.4,"top_performers":4.2,"assessment_count":87}}', 0.65, 3.4, 0),

('Pharmaceuticals', '325', 'PHAR', '{"industry_code":"PHAR","ai_adoption_level":"High","risk_profile":"Very High","description":"Drug development, manufacturing. AI for drug discovery, clinical trials, manufacturing optimization, pharmacovigilance.","benchmarks":{"average_maturity":3.7,"top_performers":4.5,"assessment_count":71}}', 0.55, 3.7, 0),

('Food & Beverage', '31', 'F&B', '{"industry_code":"F&B","ai_adoption_level":"Medium","risk_profile":"Medium","description":"Food production, processing, distribution. AI for quality control, supply chain, demand forecasting, personalization.","benchmarks":{"average_maturity":2.8,"top_performers":3.7,"assessment_count":63}}', 0.50, 2.8, 0),

('Hospitality', '72', 'HOSP', '{"industry_code":"HOSP","ai_adoption_level":"High","risk_profile":"Medium","description":"Hotels, restaurants, travel, tourism. AI for personalization, revenue management, operations, customer service.","benchmarks":{"average_maturity":3.0,"top_performers":3.9,"assessment_count":81}}', 0.65, 3.0, 0),

('Media & Entertainment', '51', 'M&E', '{"industry_code":"M&E","ai_adoption_level":"Very High","risk_profile":"Medium","description":"Content production, streaming, gaming, publishing. AI for recommendation, creation, moderation, personalization.","benchmarks":{"average_maturity":3.3,"top_performers":4.1,"assessment_count":124}}', 0.85, 3.3, 0),

('Real Estate', '53', 'RE', '{"industry_code":"RE","ai_adoption_level":"Medium","risk_profile":"Low-Medium","description":"Property development, management, brokerage. AI for valuation, market analysis, smart buildings, tenant services.","benchmarks":{"average_maturity":2.6,"top_performers":3.5,"assessment_count":57}}', 0.45, 2.6, 0),

('Agriculture', '11', 'AGR', '{"industry_code":"AGR","ai_adoption_level":"Medium","risk_profile":"Medium","description":"Crop production, livestock, agtech. AI for precision farming, crop monitoring, yield optimization, livestock management.","benchmarks":{"average_maturity":2.5,"top_performers":3.4,"assessment_count":48}}', 0.40, 2.5, 0),

('Construction', '23', 'CON', '{"industry_code":"CON","ai_adoption_level":"Medium","risk_profile":"High","description":"Building construction, infrastructure. AI for project management, safety, design optimization, equipment automation.","benchmarks":{"average_maturity":2.7,"top_performers":3.6,"assessment_count":54}}', 0.45, 2.7, 0),

('Legal Services', '54', 'LEG', '{"industry_code":"LEG","ai_adoption_level":"High","risk_profile":"Medium","description":"Law firms, corporate legal, legal tech. AI for document analysis, legal research, contract review, case prediction.","benchmarks":{"average_maturity":3.1,"top_performers":3.9,"assessment_count":69}}', 0.70, 3.1, 0),

('Insurance', '524', 'INS', '{"industry_code":"INS","ai_adoption_level":"Very High","risk_profile":"High","description":"Life, health, property, casualty insurance. AI for underwriting, claims processing, fraud detection, risk assessment.","benchmarks":{"average_maturity":3.6,"top_performers":4.4,"assessment_count":98}}', 0.75, 3.6, 0),

('Logistics', '48-49', 'LOG', '{"industry_code":"LOG","ai_adoption_level":"Very High","risk_profile":"Medium","description":"Freight, warehousing, delivery. AI for route optimization, warehouse automation, demand forecasting, inventory management.","benchmarks":{"average_maturity":3.5,"top_performers":4.3,"assessment_count":102}}', 0.80, 3.5, 0),

('Consulting', '54', 'CONS', '{"industry_code":"CONS","ai_adoption_level":"High","risk_profile":"Low-Medium","description":"Management consulting, IT consulting, strategy. AI for data analysis, strategy development, client insights.","benchmarks":{"average_maturity":3.2,"top_performers":4.0,"assessment_count":76}}', 0.70, 3.2, 0),

('Non-Profit', '81', 'NPO', '{"industry_code":"NPO","ai_adoption_level":"Low-Medium","risk_profile":"Medium","description":"Charities, NGOs, foundations. AI for donor management, program optimization, impact measurement, fundraising.","benchmarks":{"average_maturity":2.3,"top_performers":3.2,"assessment_count":41}}', 0.35, 2.3, 0),

('Defense', '92', 'DEF', '{"industry_code":"DEF","ai_adoption_level":"Very High","risk_profile":"Very High","description":"Military, intelligence, homeland security. AI for autonomous systems, intelligence analysis, cybersecurity, decision support.","benchmarks":{"average_maturity":3.8,"top_performers":4.6,"assessment_count":38}}', 0.70, 3.8, 0),

('Mining', '21', 'MIN', '{"industry_code":"MIN","ai_adoption_level":"Medium","risk_profile":"Very High","description":"Mineral extraction, oil and gas. AI for exploration, operations optimization, safety monitoring, environmental management.","benchmarks":{"average_maturity":2.9,"top_performers":3.8,"assessment_count":44}}', 0.55, 2.9, 0),

('Utilities', '22', 'UTIL', '{"industry_code":"UTIL","ai_adoption_level":"High","risk_profile":"Very High","description":"Water, gas, electric services. AI for grid management, customer service, infrastructure maintenance, demand forecasting.","benchmarks":{"average_maturity":3.3,"top_performers":4.1,"assessment_count":67}}', 0.65, 3.3, 0),

('Chemical', '325', 'CHEM', '{"industry_code":"CHEM","ai_adoption_level":"Medium-High","risk_profile":"Very High","description":"Specialty and industrial chemicals. AI for process optimization, safety monitoring, quality control, R&D.","benchmarks":{"average_maturity":3.2,"top_performers":4.0,"assessment_count":59}}', 0.60, 3.2, 0),

('Professional Services', '54', 'PROF', '{"industry_code":"PROF","ai_adoption_level":"High","risk_profile":"Medium","description":"Accounting, HR, legal, business services. AI for automation, analytics, compliance, client services.","benchmarks":{"average_maturity":3.3,"top_performers":4.1,"assessment_count":84}}', 0.70, 3.3, 0);

-- ========================================
-- VERIFICATION
-- ========================================
SELECT COUNT(*) as total_industries FROM industries;
