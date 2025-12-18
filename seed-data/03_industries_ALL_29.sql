-- ========================================
-- ETHOS UARI+ PLATFORM
-- SEED DATA: ALL 29 INDUSTRY PROFILES
-- Created: 2025-12-18
-- Purpose: Complete industry intelligence for AI assessments
-- ========================================

-- INDUSTRY 1: HEALTHCARE
INSERT INTO industries (
  industry_name,
  industry_code,
  ai_adoption_level,
  risk_profile,
  description,
  regulatory_context,
  key_challenges,
  ai_use_cases,
  best_practices,
  benchmark_data,
  created_at,
  updated_at
) VALUES (
  'Healthcare',
  'HC',
  'Very High',
  'High',
  'The healthcare industry encompasses hospitals, clinics, pharmaceutical companies, medical device manufacturers, health insurance, and health technology providers. AI adoption is rapidly accelerating in diagnostic imaging, drug discovery, patient monitoring, clinical decision support, and administrative automation. Market size: $4.3 trillion globally with AI market at $19.8 billion (2024), growing at 37% CAGR.',
  '{"regulations": ["HIPAA (Health Insurance Portability and Accountability Act)", "FDA Regulations for Medical Devices", "GDPR (for EU operations)", "State-Specific Healthcare Regulations"], "ai_considerations": ["Clinical validation required for diagnostic systems", "Informed consent for AI use in patient care", "Clear accountability for AI-assisted medical decisions", "Critical bias concerns for diagnostic systems", "Explainability required for clinicians", "Patient safety paramount with rigorous testing"]}',
  '["Patient Data Privacy and Security: HIPAA compliance, encryption, access controls", "Clinical Validation of AI Systems: Proving safety and effectiveness", "Integration with Existing Healthcare IT: Legacy systems and interoperability", "Regulatory Compliance Across Jurisdictions: Different regulations by location", "Bias in Diagnostic Algorithms: Performance differences across demographics", "Explainability for Clinical Decision Support: Clinician trust and understanding"]',
  '["Diagnostic Imaging: AI-powered analysis of X-rays, MRIs, CT scans - 65% adoption", "Drug Discovery: AI-accelerated pharmaceutical R&D - 45% adoption", "Patient Monitoring: Real-time health monitoring and early warning - 40% adoption", "Clinical Decision Support: AI-assisted diagnosis and treatment - 35% adoption", "Administrative Automation: Scheduling, billing, claims processing - 70% adoption"]',
  '["Implement robust clinical validation processes with continuous monitoring", "Ensure explainability of AI diagnostic systems for clinicians", "Maintain comprehensive audit trails for all AI decisions", "Conduct regular bias testing and mitigation across demographics", "Establish strong patient data governance with privacy-by-design", "Ensure continuous monitoring of AI system performance"]',
  '{"average_maturity": 3.5, "top_performers": 4.2, "assessment_count": 127, "domain_scores": {"D1": 3.8, "D2": 3.6, "D3": 3.7, "D4": 4.1, "D5": 4.1, "D6": 3.4, "D7": 3.2, "D8": 2.8}, "trends": ["Safety and privacy scores increasing due to regulatory pressure", "Transparency scores improving with clinician demand", "Environmental sustainability lagging", "Social impact awareness growing with health equity focus"]}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRY 2: FINANCIAL SERVICES
INSERT INTO industries VALUES (
  NULL,
  'Financial Services',
  'FS',
  'Very High',
  'High',
  'Financial services include banking, insurance, investment management, fintech, payment processing, and financial technology. AI is extensively used for fraud detection, credit scoring, algorithmic trading, customer service, risk management, and regulatory compliance. Market size: $26.5 trillion globally with AI market at $44.1 billion (2024), growing at 28% CAGR.',
  '{"regulations": ["SOX (Sarbanes-Oxley Act)", "Basel III / Basel IV", "GDPR / CCPA", "Fair Lending Laws (ECOA, Fair Housing Act)", "MiFID II (EU)"], "ai_considerations": ["Comprehensive model risk management required", "Explainability required by regulators", "Strict anti-discrimination requirements", "Complete audit trails mandatory", "AI models must be stress-tested"]}',
  '["Regulatory Compliance Complexity: Multiple overlapping regulations with frequent changes", "Bias and Fairness in Credit Decisions: Historical data biases and protected classes", "Model Risk Management: Complex AI model validation and drift monitoring", "Explainability for Regulatory Compliance: Regulators and customers require explanations", "Cybersecurity and Fraud: High-value targets and adversarial attacks", "Data Privacy and Customer Trust: Sensitive financial data protection critical"]',
  '["Fraud Detection: Real-time transaction monitoring - 85% adoption", "Credit Scoring: Alternative data for lending decisions - 70% adoption", "Algorithmic Trading: Automated trading strategies - 90% adoption", "Customer Service Chatbots: Automated customer support - 75% adoption", "Risk Management: Portfolio optimization and stress testing - 60% adoption"]',
  '["Comprehensive model risk management framework", "Regular fairness and bias testing across demographics", "Explainable AI for customer-facing decisions", "Robust cybersecurity for AI systems", "Continuous model monitoring and validation", "Strong data governance and privacy controls"]',
  '{"average_maturity": 3.8, "top_performers": 4.5, "assessment_count": 215, "domain_scores": {"D1": 4.0, "D4": 4.2, "D5": 4.3, "D6": 3.9, "D7": 3.5, "D8": 3.0}}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRY 3: MANUFACTURING
INSERT INTO industries VALUES (
  NULL,
  'Manufacturing',
  'MFG',
  'High',
  'Medium-High',
  'Manufacturing includes discrete manufacturing (automotive, electronics, machinery) and process manufacturing (chemicals, food, pharmaceuticals). AI is used for predictive maintenance, quality control, supply chain optimization, production planning, and robotics. Market size: $14.7 trillion globally with AI market at $16.7 billion (2024), growing at 57% CAGR.',
  '{"regulations": ["ISO 9001 (Quality Management)", "ISO 27001 (Information Security)", "Industry 4.0 Standards", "OSHA (Occupational Safety)", "Environmental Regulations (EPA)"], "ai_considerations": ["Safety-critical applications in robotics", "Quality assurance and traceability", "Worker safety and human-machine collaboration", "Supply chain transparency", "Environmental impact monitoring"]}',
  '["Integration with Legacy Systems: Old equipment, data silos, high costs", "Data Quality and Availability: Sensor quality, missing data, real-time processing", "Worker Safety and Human-Machine Collaboration: Safe robotics interaction", "Supply Chain Complexity: Multi-tier chains and data sharing challenges", "Quality Assurance and Liability: Accuracy, traceability, regulatory compliance"]',
  '["Predictive Maintenance: Equipment failure prediction - 60% adoption", "Quality Control and Inspection: Automated defect detection - 55% adoption", "Production Planning and Optimization: AI-driven scheduling - 45% adoption", "Supply Chain Optimization: Demand forecasting and logistics - 40% adoption", "Robotics and Automation: AI-powered manufacturing robots - 50% adoption"]',
  '["Implement comprehensive safety protocols for AI-powered robotics", "Ensure data quality through sensor calibration and validation", "Maintain human oversight for critical production decisions", "Conduct regular bias testing for quality control AI", "Establish clear liability frameworks for AI-related issues", "Provide worker training and reskilling programs"]',
  '{"average_maturity": 3.3, "top_performers": 4.0, "assessment_count": 89, "domain_scores": {"D1": 3.4, "D4": 3.9, "D5": 3.2, "D8": 3.5}}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRY 4: RETAIL
INSERT INTO industries VALUES (
  NULL,
  'Retail',
  'RET',
  'High',
  'Medium',
  'Retail includes e-commerce, brick-and-mortar stores, omnichannel retailers, and marketplaces. AI is used for personalization, demand forecasting, inventory optimization, dynamic pricing, customer service, and fraud detection. Market size: $27.7 trillion globally with AI market at $23.3 billion (2024), growing at 34% CAGR.',
  '{"regulations": ["GDPR / CCPA / Privacy Laws", "Consumer Protection Laws", "PCI DSS (Payment Card Industry)"], "ai_considerations": ["Personalization vs privacy balance", "Price discrimination concerns", "Algorithmic bias in recommendations", "Transparency in automated decisions", "Customer consent for AI use"]}',
  '["Personalization vs Privacy: Balancing data collection with privacy expectations", "Bias in Recommendation Systems: Filter bubbles and demographic bias", "Dynamic Pricing Ethics: Price discrimination and fairness concerns", "Customer Trust and Transparency: Trust in AI recommendations", "Data Security and Fraud: Customer data protection and fraud prevention"]',
  '["Personalization and Recommendations: Product suggestions - 90% adoption", "Demand Forecasting: Inventory optimization - 70% adoption", "Dynamic Pricing: Real-time price optimization - 50% adoption", "Customer Service Chatbots: Automated support - 75% adoption", "Fraud Detection: Payment and account fraud prevention - 85% adoption"]',
  '["Implement privacy-preserving personalization techniques", "Regular bias testing for recommendation systems", "Transparent communication about AI use", "Customer control over data and preferences", "Fair and transparent pricing practices", "Robust fraud detection with low false positives"]',
  '{"average_maturity": 3.2, "top_performers": 4.0, "assessment_count": 156}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRY 5: TECHNOLOGY
INSERT INTO industries VALUES (
  NULL,
  'Technology',
  'TECH',
  'Very High',
  'High',
  'Technology sector includes software companies, cloud providers, AI/ML companies, SaaS platforms, hardware manufacturers, and technology services. This industry is both a creator and consumer of AI, with AI embedded in products and used internally. Market size: $5.2 trillion globally, leading AI development and adoption.',
  '{"regulations": ["GDPR / CCPA / Global Privacy Laws", "EU AI Act (upcoming)", "Sector-Specific Regulations", "Platform Regulations"], "ai_considerations": ["Product liability for AI systems", "Ethical AI development practices", "Transparency and explainability", "Bias and fairness in AI products", "Environmental impact of AI infrastructure"]}',
  '["Balancing Innovation with Responsibility: Speed vs safety trade-offs", "Managing AI Product Liability: Legal and ethical accountability", "Ensuring Fairness in AI Products: Bias detection and mitigation", "Environmental Impact of AI Infrastructure: Energy consumption concerns", "Talent Competition and Retention: Skilled AI workforce shortage", "Rapid Technology Evolution: Keeping pace with AI advances"]',
  '["AI Product Development: Core AI products and services - 95% adoption", "Cloud AI Services: MLaaS and AI platforms - 90% adoption", "Internal Operations Optimization: AI for efficiency - 85% adoption", "Content Moderation: Automated content review - 70% adoption", "Personalization Engines: User experience optimization - 95% adoption"]',
  '["Establish comprehensive AI ethics frameworks", "Implement responsible AI development practices", "Conduct regular bias and fairness testing", "Prioritize environmental sustainability", "Maintain transparency with users and stakeholders", "Invest in AI safety research"]',
  '{"average_maturity": 3.9, "top_performers": 4.7, "assessment_count": 203}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRY 6: EDUCATION
INSERT INTO industries VALUES (
  NULL,
  'Education',
  'EDU',
  'High',
  'Medium',
  'Education sector includes K-12 schools, higher education institutions, EdTech companies, online learning platforms, and corporate training providers. AI is used for adaptive learning, student assessment, administrative automation, personalized tutoring, and learning analytics. Growing focus on equitable access and learning outcomes.',
  '{"regulations": ["FERPA (Family Educational Rights and Privacy Act)", "COPPA (Children Online Privacy Protection Act)", "GDPR (for EU institutions)", "State Education Regulations"], "ai_considerations": ["Student data privacy protection", "Algorithmic bias in assessment and placement", "Equitable access to AI-enhanced education", "Teacher autonomy and AI assistance balance", "Developmental appropriateness for different ages"]}',
  '["Student Data Privacy: Protecting sensitive educational records", "Algorithmic Bias in Assessment: Fair evaluation across demographics", "Digital Divide: Equitable access to AI-enhanced learning", "Teacher Training: Effective integration of AI tools", "Learning Effectiveness: Proving AI improves outcomes", "Age-Appropriate AI: Different needs for different age groups"]',
  '["Adaptive Learning Platforms: Personalized learning paths - 45% adoption", "Automated Grading: Essay and assignment evaluation - 40% adoption", "Student Success Prediction: Early warning systems - 35% adoption", "Intelligent Tutoring Systems: One-on-one AI tutoring - 30% adoption", "Administrative Automation: Admissions, scheduling, support - 60% adoption"]',
  '["Implement strict student data privacy protections", "Conduct bias testing for assessment algorithms", "Ensure equitable access to AI learning tools", "Provide comprehensive teacher training on AI tools", "Maintain human oversight of AI recommendations", "Use age-appropriate AI implementations"]',
  '{"average_maturity": 2.9, "top_performers": 3.8, "assessment_count": 67}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRY 7: ENERGY
INSERT INTO industries VALUES (
  NULL,
  'Energy',
  'ENR',
  'High',
  'High',
  'Energy sector includes electricity generation (renewable and traditional), transmission and distribution, oil and gas, and energy services. AI is used for grid optimization, predictive maintenance, renewable energy forecasting, demand response, and asset management. Critical infrastructure with safety and reliability imperatives.',
  '{"regulations": ["NERC (North American Electric Reliability Corporation)", "FERC (Federal Energy Regulatory Commission)", "EPA Environmental Regulations", "Pipeline Safety Regulations"], "ai_considerations": ["Critical infrastructure protection", "Grid stability and reliability", "Environmental impact monitoring", "Safety in hazardous environments", "Cybersecurity for energy systems"]}',
  '["Grid Reliability: AI decisions affecting power stability", "Cybersecurity Threats: Protecting critical infrastructure from attacks", "Integration of Renewables: Managing variable renewable energy sources", "Safety in Operations: Preventing accidents in hazardous environments", "Regulatory Compliance: Meeting reliability and environmental standards", "Legacy System Integration: Modernizing aging infrastructure"]',
  '["Grid Optimization: Load balancing and demand response - 55% adoption", "Predictive Maintenance: Equipment failure prevention - 65% adoption", "Renewable Energy Forecasting: Wind and solar prediction - 60% adoption", "Energy Trading: Automated trading strategies - 50% adoption", "Asset Management: Lifecycle optimization - 45% adoption"]',
  '["Implement robust cybersecurity for AI-controlled grid systems", "Maintain human oversight for critical infrastructure decisions", "Conduct rigorous safety testing for AI in hazardous environments", "Ensure AI system reliability and failover mechanisms", "Monitor environmental impact of energy operations", "Validate AI models for critical applications"]',
  '{"average_maturity": 3.4, "top_performers": 4.1, "assessment_count": 78}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRY 8: TRANSPORTATION
INSERT INTO industries VALUES (
  NULL,
  'Transportation',
  'TRN',
  'Very High',
  'High',
  'Transportation includes aviation, maritime, rail, public transit, logistics, and mobility services. AI is used for autonomous vehicles, route optimization, traffic management, predictive maintenance, and safety systems. High safety and reliability requirements with significant regulatory oversight.',
  '{"regulations": ["FAA (Federal Aviation Administration)", "DOT (Department of Transportation)", "NHTSA (National Highway Traffic Safety Administration)", "IMO (International Maritime Organization)"], "ai_considerations": ["Safety-critical autonomous systems", "Liability for AI-related accidents", "Real-time decision making under uncertainty", "Environmental impact of transportation", "Public trust in autonomous systems"]}',
  '["Safety Assurance: Proving AI systems are safe for public use", "Liability and Insurance: Determining responsibility for AI accidents", "Regulatory Approval: Meeting safety standards for autonomous systems", "Public Trust: Gaining acceptance of AI-driven transportation", "Infrastructure Readiness: Supporting autonomous vehicles", "Cybersecurity: Protecting against remote attacks"]',
  '["Autonomous Vehicles: Self-driving cars and trucks - 20% adoption", "Route Optimization: Logistics and delivery optimization - 70% adoption", "Traffic Management: Smart traffic control - 45% adoption", "Predictive Maintenance: Fleet maintenance optimization - 60% adoption", "Safety Systems: Collision avoidance and monitoring - 55% adoption"]',
  '["Implement rigorous safety testing and validation", "Establish clear liability frameworks for autonomous systems", "Maintain human oversight capabilities", "Conduct comprehensive cybersecurity assessments", "Ensure transparency in AI decision-making", "Monitor and report safety incidents"]',
  '{"average_maturity": 3.1, "top_performers": 4.0, "assessment_count": 94}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRY 9: TELECOMMUNICATIONS
INSERT INTO industries VALUES (
  NULL,
  'Telecommunications',
  'TEL',
  'Very High',
  'Medium-High',
  'Telecommunications includes wireless carriers, internet service providers, network infrastructure providers, and communication platforms. AI is used for network optimization, customer service, fraud detection, predictive maintenance, and quality of service management. Critical infrastructure with high data volumes.',
  '{"regulations": ["FCC (Federal Communications Commission)", "GDPR / Privacy Laws", "Telecommunications Act", "Net Neutrality Regulations"], "ai_considerations": ["Network reliability and uptime", "Customer data privacy", "Service quality assurance", "Fraud prevention", "Infrastructure security"]}',
  '["Network Reliability: Maintaining service availability and performance", "Data Privacy: Protecting customer communications and metadata", "Fraud Detection: Preventing service theft and abuse", "Customer Churn: Retaining customers with AI insights", "Infrastructure Optimization: Capacity planning and efficiency", "Regulatory Compliance: Meeting telecom regulations"]',
  '["Network Optimization: Traffic routing and capacity management - 80% adoption", "Customer Service Chatbots: Automated support - 85% adoption", "Fraud Detection: Subscription and usage fraud prevention - 75% adoption", "Predictive Maintenance: Network equipment maintenance - 65% adoption", "Customer Churn Prediction: Retention strategies - 70% adoption"]',
  '["Implement robust network monitoring and optimization", "Ensure customer data privacy and security", "Deploy effective fraud detection systems", "Maintain service quality and reliability", "Provide transparent customer communication", "Conduct regular security assessments"]',
  '{"average_maturity": 3.5, "top_performers": 4.3, "assessment_count": 112}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRY 10: GOVERNMENT
INSERT INTO industries VALUES (
  NULL,
  'Government & Public Sector',
  'GOV',
  'Medium',
  'High',
  'Government includes federal, state, and local agencies, public services, law enforcement, defense, and policy-making bodies. AI is used for public services, fraud detection, policy analysis, resource allocation, and decision support. High public trust requirements and accountability expectations.',
  '{"regulations": ["Government-specific privacy laws", "Freedom of Information Act", "Ethics in Government Act", "Public procurement regulations"], "ai_considerations": ["Public accountability and transparency", "Fairness and non-discrimination", "Due process protection", "Public trust", "Democratic governance compatibility"]}',
  '["Public Trust and Accountability: Maintaining citizen confidence", "Algorithmic Bias: Ensuring fairness in public services", "Transparency vs Security: Balancing openness with safety", "Due Process: Protecting citizen rights in AI decisions", "Procurement Complexity: Acquiring and deploying AI systems", "Legacy System Integration: Modernizing government IT"]',
  '["Fraud Detection: Benefits and tax fraud prevention - 50% adoption", "Resource Allocation: Public service optimization - 35% adoption", "Policy Analysis: Data-driven policy development - 30% adoption", "Citizen Services: Chatbots and automated assistance - 45% adoption", "Predictive Analytics: Crime, health, infrastructure - 40% adoption"]',
  '["Implement transparent AI decision-making processes", "Conduct rigorous bias and fairness testing", "Ensure public oversight and accountability", "Protect due process and citizen rights", "Provide clear explanations for AI decisions", "Maintain human decision authority for critical matters"]',
  '{"average_maturity": 2.7, "top_performers": 3.6, "assessment_count": 52}',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
);

-- INDUSTRIES 11-29: Structured profiles with core data
-- INDUSTRY 11: AEROSPACE
INSERT INTO industries VALUES (
  NULL, 'Aerospace & Defense', 'AER', 'High', 'Very High',
  'Aerospace includes aircraft manufacturing, space systems, defense contractors, and aviation services. AI is used for flight systems, maintenance, design optimization, autonomous systems, and defense applications. Extremely high safety and security requirements.',
  '{"regulations": ["FAA Regulations", "ITAR (International Traffic in Arms)", "AS9100 Quality Standards", "Export Control Regulations"], "ai_considerations": ["Safety-critical systems", "National security concerns", "Export restrictions", "Reliability requirements", "Certification processes"]}',
  '["Safety Certification: Meeting rigorous aviation safety standards", "Security Clearances: Defense and classified applications", "Reliability: Zero-tolerance for failures", "Long Development Cycles: Extensive testing required", "Supply Chain Security: Protecting against threats"]',
  '["Flight Control Systems: Autonomous and assisted flight - 40% adoption", "Predictive Maintenance: Aircraft maintenance optimization - 70% adoption", "Design Optimization: AI-assisted engineering - 50% adoption", "Autonomous Systems: Drones and UAVs - 60% adoption", "Intelligence Analysis: Defense applications - 55% adoption"]',
  '["Implement rigorous safety certification processes", "Maintain highest reliability standards", "Ensure supply chain security", "Conduct extensive testing and validation", "Protect national security interests", "Maintain human oversight for critical decisions"]',
  '{"average_maturity": 3.6, "top_performers": 4.4, "assessment_count": 43}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 12: AUTOMOTIVE
INSERT INTO industries VALUES (
  NULL, 'Automotive', 'AUTO', 'Very High', 'High',
  'Automotive includes vehicle manufacturers, suppliers, dealerships, and mobility services. AI is used for autonomous driving, manufacturing, connected vehicles, and customer experience. Rapidly evolving with significant safety and liability considerations.',
  '{"regulations": ["NHTSA Safety Standards", "EPA Emissions Regulations", "Consumer Product Safety", "Data Privacy Laws"], "ai_considerations": ["Autonomous vehicle safety", "Liability for accidents", "Cybersecurity", "Data privacy", "Environmental impact"]}',
  '["Autonomous Driving Safety: Proving self-driving safety", "Liability Framework: Determining accident responsibility", "Cybersecurity: Protecting connected vehicles", "Manufacturing Integration: Industry 4.0 adoption", "Consumer Trust: Acceptance of autonomous features"]',
  '["Autonomous Driving: ADAS and self-driving features - 65% adoption", "Manufacturing Automation: AI-powered production - 70% adoption", "Connected Vehicle Services: Telematics and features - 75% adoption", "Predictive Maintenance: Vehicle health monitoring - 60% adoption", "Customer Experience: Personalization and support - 55% adoption"]',
  '["Implement comprehensive safety testing for autonomous features", "Establish clear liability frameworks", "Ensure robust cybersecurity measures", "Maintain transparency with consumers", "Conduct regular bias testing", "Monitor environmental impact"]',
  '{"average_maturity": 3.4, "top_performers": 4.2, "assessment_count": 87}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 13: PHARMACEUTICALS
INSERT INTO industries VALUES (
  NULL, 'Pharmaceuticals', 'PHAR', 'High', 'Very High',
  'Pharmaceuticals includes drug development, manufacturing, and distribution. AI is used for drug discovery, clinical trials, manufacturing optimization, and pharmacovigilance. Stringent regulatory requirements and patient safety imperatives.',
  '{"regulations": ["FDA Drug Approval Process", "GMP (Good Manufacturing Practices)", "Clinical Trial Regulations", "Pharmacovigilance Requirements"], "ai_considerations": ["Drug safety and efficacy", "Clinical trial integrity", "Manufacturing quality", "Patient data protection", "Regulatory compliance"]}',
  '["Regulatory Approval: Meeting FDA and international standards", "Drug Safety: Ensuring patient safety throughout lifecycle", "Clinical Trial Design: Ethical and effective trials", "Manufacturing Quality: GMP compliance", "Data Integrity: Ensuring research data quality"]',
  '["Drug Discovery: AI-accelerated development - 55% adoption", "Clinical Trial Optimization: Patient recruitment and monitoring - 45% adoption", "Manufacturing Optimization: Process control - 50% adoption", "Pharmacovigilance: Adverse event detection - 60% adoption", "Precision Medicine: Personalized treatments - 40% adoption"]',
  '["Conduct rigorous safety and efficacy testing", "Ensure clinical trial integrity and ethics", "Maintain GMP compliance in manufacturing", "Implement robust pharmacovigilance systems", "Protect patient data privacy", "Ensure regulatory compliance across jurisdictions"]',
  '{"average_maturity": 3.7, "top_performers": 4.5, "assessment_count": 71}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 14: FOOD & BEVERAGE
INSERT INTO industries VALUES (
  NULL, 'Food & Beverage', 'F&B', 'Medium', 'Medium',
  'Food & Beverage includes food production, processing, distribution, and restaurants. AI is used for quality control, supply chain optimization, demand forecasting, and personalization. Food safety and quality are paramount.',
  '{"regulations": ["FDA Food Safety Regulations", "HACCP Standards", "Labeling Requirements", "Environmental Regulations"], "ai_considerations": ["Food safety assurance", "Quality control", "Supply chain traceability", "Allergen detection", "Sustainability"]}',
  '["Food Safety: Preventing contamination and recalls", "Quality Consistency: Maintaining product quality", "Supply Chain Traceability: Farm-to-table tracking", "Demand Forecasting: Managing perishable inventory", "Sustainability: Reducing waste and environmental impact"]',
  '["Quality Control: Automated inspection - 55% adoption", "Supply Chain Optimization: Logistics and forecasting - 50% adoption", "Demand Forecasting: Inventory optimization - 60% adoption", "Recipe Optimization: Product development - 35% adoption", "Customer Personalization: Recommendations - 40% adoption"]',
  '["Implement rigorous quality control systems", "Ensure supply chain traceability", "Maintain food safety standards", "Optimize for sustainability", "Manage demand for perishables effectively", "Ensure allergen detection accuracy"]',
  '{"average_maturity": 2.8, "top_performers": 3.7, "assessment_count": 63}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 15: HOSPITALITY
INSERT INTO industries VALUES (
  NULL, 'Hospitality', 'HOSP', 'High', 'Medium',
  'Hospitality includes hotels, restaurants, travel, tourism, and event management. AI is used for personalization, revenue management, operations optimization, and customer service. Focus on customer experience and operational efficiency.',
  '{"regulations": ["Consumer Protection Laws", "Privacy Regulations", "Health and Safety Codes", "Labor Regulations"], "ai_considerations": ["Customer privacy", "Service quality", "Dynamic pricing ethics", "Employee impact", "Cultural sensitivity"]}',
  '["Customer Privacy: Balancing personalization with privacy", "Dynamic Pricing Ethics: Fairness in pricing strategies", "Service Quality: Maintaining personal touch with automation", "Labor Impact: Job displacement concerns", "Cultural Sensitivity: Diverse customer needs"]',
  '["Revenue Management: Dynamic pricing - 70% adoption", "Personalization: Guest preferences and recommendations - 65% adoption", "Operations Optimization: Staffing and inventory - 55% adoption", "Customer Service: Chatbots and virtual concierges - 60% adoption", "Sentiment Analysis: Review and feedback analysis - 50% adoption"]',
  '["Implement privacy-preserving personalization", "Ensure fair and transparent pricing", "Maintain service quality with automation", "Support employee adaptation and training", "Respect cultural diversity", "Monitor customer satisfaction"]',
  '{"average_maturity": 3.0, "top_performers": 3.9, "assessment_count": 81}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 16: MEDIA & ENTERTAINMENT
INSERT INTO industries VALUES (
  NULL, 'Media & Entertainment', 'M&E', 'Very High', 'Medium',
  'Media & Entertainment includes content production, streaming platforms, gaming, publishing, and social media. AI is used for content recommendation, creation, moderation, and personalization. Copyright and content authenticity concerns.',
  '{"regulations": ["Copyright Law", "Content Moderation Requirements", "Privacy Laws", "Platform Regulations"], "ai_considerations": ["Content authenticity", "Copyright protection", "Bias in recommendations", "Content moderation accuracy", "Creator rights"]}',
  '["Content Authenticity: Deepfakes and synthetic media", "Copyright Protection: AI-generated content ownership", "Recommendation Bias: Filter bubbles and diversity", "Content Moderation: Balancing free speech and safety", "Creator Compensation: Fair payment for AI use"]',
  '["Content Recommendation: Personalized suggestions - 95% adoption", "Content Creation: AI-assisted production - 50% adoption", "Content Moderation: Automated review - 75% adoption", "Audience Analytics: Viewership insights - 80% adoption", "Rights Management: Copyright detection - 70% adoption"]',
  '["Ensure content authenticity and labeling", "Protect copyright and creator rights", "Mitigate recommendation bias", "Implement fair content moderation", "Maintain transparency with users", "Support diverse content discovery"]',
  '{"average_maturity": 3.3, "top_performers": 4.1, "assessment_count": 124}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 17: REAL ESTATE
INSERT INTO industries VALUES (
  NULL, 'Real Estate', 'RE', 'Medium', 'Low-Medium',
  'Real Estate includes property development, management, brokerage, and investment. AI is used for property valuation, market analysis, smart buildings, and tenant services. Growing adoption in property technology.',
  '{"regulations": ["Fair Housing Act", "Real Estate License Laws", "Building Codes", "Privacy Regulations"], "ai_considerations": ["Fair housing compliance", "Property valuation accuracy", "Data privacy", "Building safety", "Market manipulation prevention"]}',
  '["Fair Housing Compliance: Non-discriminatory AI in housing", "Valuation Accuracy: Reliable property pricing", "Data Privacy: Protecting personal information", "Market Transparency: Preventing manipulation", "Smart Building Safety: IoT and automation safety"]',
  '["Property Valuation: Automated appraisals - 45% adoption", "Market Analysis: Investment insights - 50% adoption", "Smart Building Management: IoT optimization - 40% adoption", "Tenant Services: Automated support - 35% adoption", "Lead Generation: Customer targeting - 60% adoption"]',
  '["Ensure fair housing compliance", "Validate property valuation accuracy", "Protect customer data privacy", "Maintain market transparency", "Implement safe smart building systems", "Conduct bias testing for tenant selection"]',
  '{"average_maturity": 2.6, "top_performers": 3.5, "assessment_count": 57}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 18: AGRICULTURE
INSERT INTO industries VALUES (
  NULL, 'Agriculture', 'AGR', 'Medium', 'Medium',
  'Agriculture includes crop production, livestock, agtech, and food production. AI is used for precision farming, crop monitoring, yield optimization, and livestock management. Sustainability and food security focus.',
  '{"regulations": ["Agricultural Regulations", "Environmental Protection Laws", "Food Safety Standards", "Pesticide Regulations"], "ai_considerations": ["Environmental impact", "Food safety", "Animal welfare", "Sustainability", "Data ownership (farm data)"]}',
  '["Environmental Sustainability: Reducing agricultural impact", "Food Safety: Preventing contamination", "Data Ownership: Control of farm data", "Technology Access: Digital divide in agriculture", "Climate Adaptation: Resilience to climate change"]',
  '["Precision Farming: Optimized resource use - 40% adoption", "Crop Monitoring: Disease and pest detection - 45% adoption", "Yield Prediction: Harvest forecasting - 50% adoption", "Livestock Management: Health monitoring - 35% adoption", "Supply Chain Optimization: Logistics and distribution - 40% adoption"]',
  '["Implement sustainable farming practices", "Ensure food safety throughout production", "Protect farmer data ownership rights", "Provide equitable technology access", "Support climate adaptation", "Monitor environmental impact"]',
  '{"average_maturity": 2.5, "top_performers": 3.4, "assessment_count": 48}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 19: CONSTRUCTION
INSERT INTO industries VALUES (
  NULL, 'Construction', 'CON', 'Medium', 'High',
  'Construction includes building construction, infrastructure, and engineering. AI is used for project management, safety monitoring, design optimization, and equipment automation. Safety and project delivery focus.',
  '{"regulations": ["Building Codes", "OSHA Safety Standards", "Environmental Regulations", "Contract Law"], "ai_considerations": ["Worker safety", "Project delivery", "Quality assurance", "Environmental impact", "Cost control"]}',
  '["Worker Safety: Preventing accidents and injuries", "Project Delays: On-time and on-budget delivery", "Quality Assurance: Meeting specifications", "Labor Shortage: Addressing skilled worker gaps", "Environmental Impact: Sustainable construction"]',
  '["Project Management: Schedule and cost optimization - 50% adoption", "Safety Monitoring: Hazard detection - 45% adoption", "Design Optimization: BIM and generative design - 55% adoption", "Equipment Automation: Autonomous machinery - 30% adoption", "Quality Control: Defect detection - 40% adoption"]',
  '["Implement comprehensive safety monitoring", "Ensure project management accuracy", "Maintain quality standards", "Support worker training and safety", "Monitor environmental impact", "Validate AI recommendations"]',
  '{"average_maturity": 2.7, "top_performers": 3.6, "assessment_count": 54}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 20: LEGAL SERVICES
INSERT INTO industries VALUES (
  NULL, 'Legal Services', 'LEG', 'High', 'Medium',
  'Legal Services includes law firms, corporate legal departments, and legal tech companies. AI is used for document analysis, legal research, contract review, and case prediction. Confidentiality and accuracy critical.',
  '{"regulations": ["Attorney-Client Privilege", "Professional Conduct Rules", "Data Privacy Laws", "Unauthorized Practice of Law"], "ai_considerations": ["Confidentiality protection", "Accuracy and liability", "Unauthorized practice concerns", "Bias in legal predictions", "Access to justice"]}',
  '["Confidentiality: Protecting client information", "Accuracy: Ensuring reliable legal analysis", "Professional Responsibility: Meeting ethical obligations", "Bias in Predictions: Fair case outcome predictions", "Access to Justice: Affordability and availability"]',
  '["Document Analysis: Contract and discovery review - 70% adoption", "Legal Research: Case law and precedent search - 75% adoption", "Contract Review: Automated analysis - 65% adoption", "Case Prediction: Outcome forecasting - 40% adoption", "E-Discovery: Evidence analysis - 80% adoption"]',
  '["Maintain strict confidentiality protections", "Ensure accuracy and validate outputs", "Adhere to professional conduct rules", "Conduct bias testing for predictions", "Support access to justice", "Maintain human attorney oversight"]',
  '{"average_maturity": 3.1, "top_performers": 3.9, "assessment_count": 69}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 21: INSURANCE
INSERT INTO industries VALUES (
  NULL, 'Insurance', 'INS', 'Very High', 'High',
  'Insurance includes life, health, property, casualty, and reinsurance. AI is used for underwriting, claims processing, fraud detection, and risk assessment. Regulatory compliance and fairness critical.',
  '{"regulations": ["State Insurance Regulations", "NAIC Model Laws", "Fair Credit Reporting Act", "Anti-Discrimination Laws"], "ai_considerations": ["Fair underwriting", "Claims accuracy", "Fraud detection", "Regulatory compliance", "Transparency"]}',
  '["Fair Underwriting: Non-discriminatory risk assessment", "Claims Accuracy: Appropriate claim adjudication", "Fraud Detection: Preventing fraudulent claims", "Regulatory Compliance: State-by-state variations", "Explainability: Explaining decisions to regulators and customers"]',
  '["Underwriting Automation: Risk assessment - 75% adoption", "Claims Processing: Automated adjudication - 70% adoption", "Fraud Detection: Claims fraud prevention - 85% adoption", "Risk Modeling: Pricing and reserves - 80% adoption", "Customer Service: Automated support - 65% adoption"]',
  '["Conduct fairness testing for underwriting", "Ensure claims processing accuracy", "Implement robust fraud detection", "Maintain regulatory compliance", "Provide explanations for decisions", "Monitor for discriminatory outcomes"]',
  '{"average_maturity": 3.6, "top_performers": 4.4, "assessment_count": 98}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 22: LOGISTICS
INSERT INTO industries VALUES (
  NULL, 'Logistics & Supply Chain', 'LOG', 'Very High', 'Medium',
  'Logistics includes freight, warehousing, delivery, and supply chain management. AI is used for route optimization, warehouse automation, demand forecasting, and inventory management. Efficiency and reliability focus.',
  '{"regulations": ["DOT Transportation Rules", "Customs Regulations", "Labor Laws", "Environmental Standards"], "ai_considerations": ["Delivery reliability", "Worker safety", "Environmental impact", "Customer privacy", "Labor displacement"]}',
  '["Delivery Reliability: Meeting customer expectations", "Warehouse Safety: Automation safety with human workers", "Labor Impact: Job displacement concerns", "Last-Mile Efficiency: Urban delivery optimization", "Supply Chain Visibility: End-to-end tracking"]',
  '["Route Optimization: Delivery routing - 85% adoption", "Warehouse Automation: Robotics and picking - 65% adoption", "Demand Forecasting: Inventory optimization - 75% adoption", "Delivery Prediction: ETA calculation - 80% adoption", "Fleet Management: Vehicle and driver optimization - 70% adoption"]',
  '["Optimize route efficiency sustainably", "Ensure warehouse automation safety", "Support workforce transition", "Maintain delivery reliability", "Provide supply chain transparency", "Monitor environmental impact"]',
  '{"average_maturity": 3.5, "top_performers": 4.3, "assessment_count": 102}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 23: CONSULTING
INSERT INTO industries VALUES (
  NULL, 'Consulting & Professional Services', 'CONS', 'High', 'Low-Medium',
  'Consulting includes management consulting, IT consulting, strategy, and advisory services. AI is used for data analysis, strategy development, client insights, and service delivery. Knowledge management and client confidentiality critical.',
  '{"regulations": ["Professional Conduct Standards", "Confidentiality Requirements", "Data Privacy Laws", "Conflict of Interest Rules"], "ai_considerations": ["Client confidentiality", "Data security", "Output accuracy", "Professional judgment", "Knowledge management"]}',
  '["Client Confidentiality: Protecting sensitive information", "Output Quality: Ensuring reliable recommendations", "Professional Judgment: Balancing AI with expertise", "Knowledge Management: Capturing and using insights", "Differentiation: Maintaining competitive advantage"]',
  '["Data Analysis: Insights generation - 80% adoption", "Strategy Development: AI-assisted recommendations - 50% adoption", "Client Research: Market and competitive intelligence - 70% adoption", "Project Management: Optimization and forecasting - 60% adoption", "Knowledge Management: Document and expertise search - 65% adoption"]',
  '["Maintain strict client confidentiality", "Ensure output quality and accuracy", "Preserve professional judgment", "Implement secure knowledge management", "Conduct ethics reviews", "Maintain human expertise"]',
  '{"average_maturity": 3.2, "top_performers": 4.0, "assessment_count": 76}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 24: NON-PROFIT
INSERT INTO industries VALUES (
  NULL, 'Non-Profit & NGO', 'NPO', 'Low-Medium', 'Medium',
  'Non-Profit includes charities, NGOs, foundations, and social enterprises. AI is used for donor management, program optimization, impact measurement, and fundraising. Limited resources and mission alignment focus.',
  '{"regulations": ["IRS Non-Profit Regulations", "Fundraising Regulations", "Privacy Laws", "Grant Compliance"], "ai_considerations": ["Mission alignment", "Ethical fundraising", "Beneficiary privacy", "Impact measurement", "Resource constraints"]}',
  '["Resource Constraints: Limited budgets for AI adoption", "Mission Alignment: Ensuring AI supports mission", "Beneficiary Privacy: Protecting vulnerable populations", "Impact Measurement: Demonstrating effectiveness", "Ethical Fundraising: Appropriate donor targeting"]',
  '["Donor Management: Relationship and gift optimization - 40% adoption", "Fundraising Optimization: Campaign targeting - 45% adoption", "Program Optimization: Service delivery efficiency - 30% adoption", "Impact Measurement: Outcome tracking - 35% adoption", "Volunteer Management: Coordination and matching - 25% adoption"]',
  '["Ensure mission alignment for all AI use", "Protect beneficiary privacy", "Implement ethical fundraising practices", "Measure and report impact transparently", "Optimize resource utilization", "Maintain human touch in services"]',
  '{"average_maturity": 2.3, "top_performers": 3.2, "assessment_count": 41}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 25: DEFENSE & SECURITY
INSERT INTO industries VALUES (
  NULL, 'Defense & National Security', 'DEF', 'Very High', 'Very High',
  'Defense includes military, intelligence, homeland security, and defense contractors. AI is used for autonomous systems, intelligence analysis, cybersecurity, and decision support. Highest security and reliability requirements.',
  '{"regulations": ["ITAR (International Traffic in Arms)", "National Security Laws", "Classification Requirements", "Export Controls"], "ai_considerations": ["National security", "Operational security", "Rules of engagement", "International law compliance", "Adversarial robustness"]}',
  '["Adversarial Robustness: Resisting attacks on AI systems", "Rules of Engagement: Appropriate use of force", "Operational Security: Protecting classified information", "International Law: Compliance with laws of war", "Accountability: Clear responsibility for AI actions"]',
  '["Autonomous Systems: Drones and vehicles - 60% adoption", "Intelligence Analysis: Data fusion and insights - 75% adoption", "Cybersecurity: Threat detection and response - 85% adoption", "Decision Support: Command and control - 55% adoption", "Logistics Optimization: Supply chain management - 65% adoption"]',
  '["Implement highest security standards", "Ensure adversarial robustness", "Maintain human decision authority for lethal force", "Comply with international law", "Protect classified information", "Conduct extensive testing and validation"]',
  '{"average_maturity": 3.8, "top_performers": 4.6, "assessment_count": 38}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 26: MINING & EXTRACTION
INSERT INTO industries VALUES (
  NULL, 'Mining & Extraction', 'MIN', 'Medium', 'Very High',
  'Mining includes mineral extraction, oil and gas, and resource processing. AI is used for exploration, operations optimization, safety monitoring, and environmental management. High safety and environmental risks.',
  '{"regulations": ["Mine Safety and Health Act", "Environmental Protection Laws", "Indigenous Rights", "Land Use Regulations"], "ai_considerations": ["Worker safety", "Environmental impact", "Community relations", "Resource efficiency", "Equipment reliability"]}',
  '["Worker Safety: Hazardous working conditions", "Environmental Impact: Ecosystem and climate concerns", "Community Relations: Impact on local communities", "Operational Efficiency: Maximizing resource extraction", "Regulatory Compliance: Environmental and safety standards"]',
  '["Exploration: Resource identification - 50% adoption", "Operations Optimization: Process efficiency - 60% adoption", "Safety Monitoring: Hazard detection - 70% adoption", "Predictive Maintenance: Equipment reliability - 65% adoption", "Environmental Monitoring: Impact assessment - 55% adoption"]',
  '["Prioritize worker safety with monitoring systems", "Minimize environmental impact", "Engage with local communities", "Optimize resource efficiency", "Maintain equipment reliability", "Ensure regulatory compliance"]',
  '{"average_maturity": 2.9, "top_performers": 3.8, "assessment_count": 44}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 27: UTILITIES
INSERT INTO industries VALUES (
  NULL, 'Utilities (Water, Gas, Electric)', 'UTIL', 'High', 'Very High',
  'Utilities include water, natural gas, and electric services. AI is used for grid management, customer service, infrastructure maintenance, and demand forecasting. Critical infrastructure with reliability imperatives.',
  '{"regulations": ["Public Utility Commission Rules", "EPA Environmental Standards", "NERC Reliability Standards", "Consumer Protection Laws"], "ai_considerations": ["Service reliability", "Infrastructure safety", "Environmental compliance", "Customer privacy", "Cybersecurity"]}',
  '["Service Reliability: Ensuring continuous service delivery", "Infrastructure Aging: Managing aging assets", "Cybersecurity: Protecting critical infrastructure", "Regulatory Compliance: Meeting reliability standards", "Customer Affordability: Keeping costs reasonable"]',
  '["Grid Management: Load balancing and optimization - 65% adoption", "Outage Prediction: Failure prevention - 60% adoption", "Customer Service: Automated support - 55% adoption", "Demand Forecasting: Load prediction - 70% adoption", "Asset Management: Infrastructure maintenance - 75% adoption"]',
  '["Maintain service reliability and availability", "Implement robust cybersecurity measures", "Optimize infrastructure maintenance", "Ensure regulatory compliance", "Protect customer data", "Support affordability and access"]',
  '{"average_maturity": 3.3, "top_performers": 4.1, "assessment_count": 67}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 28: CHEMICAL
INSERT INTO industries VALUES (
  NULL, 'Chemical Manufacturing', 'CHEM', 'Medium-High', 'Very High',
  'Chemical includes specialty chemicals, industrial chemicals, and materials. AI is used for process optimization, safety monitoring, quality control, and R&D. High safety and environmental risks.',
  '{"regulations": ["EPA Environmental Regulations", "OSHA Safety Standards", "REACH (EU Chemical Regulations)", "Process Safety Management"], "ai_considerations": ["Process safety", "Environmental protection", "Product quality", "Worker safety", "Regulatory compliance"]}',
  '["Process Safety: Preventing chemical accidents", "Environmental Compliance: Meeting emissions standards", "Product Quality: Consistency and specifications", "Innovation: New materials and processes", "Supply Chain Complexity: Managing hazardous materials"]',
  '["Process Optimization: Yield and efficiency - 70% adoption", "Safety Monitoring: Hazard detection - 75% adoption", "Quality Control: Product testing - 65% adoption", "R&D Acceleration: Materials discovery - 50% adoption", "Predictive Maintenance: Equipment reliability - 70% adoption"]',
  '["Implement comprehensive process safety management", "Ensure environmental compliance", "Maintain product quality standards", "Protect worker safety", "Optimize for sustainability", "Conduct rigorous testing and validation"]',
  '{"average_maturity": 3.2, "top_performers": 4.0, "assessment_count": 59}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- INDUSTRY 29: PROFESSIONAL SERVICES
INSERT INTO industries VALUES (
  NULL, 'Professional Services (Accounting, HR, Legal)', 'PROF', 'High', 'Medium',
  'Professional Services includes accounting, HR, legal, and business services. AI is used for automation, analytics, compliance, and client services. Accuracy, confidentiality, and professional standards critical.',
  '{"regulations": ["Professional Licensing Requirements", "Confidentiality Rules", "Data Privacy Laws", "Industry-Specific Standards"], "ai_considerations": ["Professional judgment", "Client confidentiality", "Accuracy and liability", "Regulatory compliance", "Ethics standards"]}',
  '["Professional Judgment: Preserving human expertise", "Confidentiality: Protecting client information", "Accuracy: Ensuring reliable outputs", "Regulatory Compliance: Meeting professional standards", "Competitive Pressure: Maintaining differentiation"]',
  '["Document Automation: Template and contract generation - 75% adoption", "Data Analytics: Financial and HR insights - 70% adoption", "Compliance Monitoring: Regulatory tracking - 65% adoption", "Client Services: Automated support - 60% adoption", "Risk Assessment: Audit and compliance - 70% adoption"]',
  '["Maintain professional judgment and oversight", "Protect client confidentiality strictly", "Ensure accuracy and validate outputs", "Comply with professional standards", "Conduct ethics reviews", "Preserve human expertise"]',
  '{"average_maturity": 3.3, "top_performers": 4.1, "assessment_count": 84}',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

-- ========================================
-- VERIFICATION QUERY
-- ========================================
-- SELECT COUNT(*) as total_industries FROM industries;
-- Expected Result: 29 industries
