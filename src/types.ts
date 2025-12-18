/**
 * ETHOS UARI+ Platform - TypeScript Type Definitions
 * Complete types for 247-question assessment system
 */

// Cloudflare D1 Database Binding
export type Bindings = {
  DB: D1Database;
}

// ============================================================================
// DOMAIN TYPES
// ============================================================================

export interface Domain {
  id: number;
  name: string;
  short_code: string;
  description: string;
  weight: number;
  order_index: number;
  created_at: string;
}

// ============================================================================
// QUESTION TYPES
// ============================================================================

export interface ResponseOption {
  value: number;
  label: string;
  score: number;
  maturity_level: number;
}

export interface EvidenceRequirements {
  required: boolean;
  guidance: string;
}

export interface MaturityIndicators {
  level_1: string;
  level_2: string;
  level_3: string;
  level_4: string;
  level_5: string;
}

export interface AssessorGuidance {
  guidance: string;
  maturity_indicators: MaturityIndicators;
}

export interface Question {
  id: number;
  domain_id: number;
  subdomain: string;
  question_code: string;
  question_text: string;
  criticality: 'CRITICAL' | 'HIGH' | 'MEDIUM' | 'LOW';
  scoring_weight: number;
  response_options: ResponseOption[];
  evidence_requirements: EvidenceRequirements;
  assessor_guidance: AssessorGuidance;
  industry_variations?: any;
  related_questions?: string[];
  regulatory_context?: any;
  created_at: string;
  updated_at: string;
}

// Database raw format (JSON fields as strings)
export interface QuestionRaw {
  id: number;
  domain_id: number;
  subdomain: string;
  question_code: string;
  question_text: string;
  criticality: string;
  scoring_weight: number;
  response_options: string;  // JSON string
  evidence_requirements: string;  // JSON string
  assessor_guidance: string;  // JSON string
  industry_variations: string | null;
  related_questions: string | null;
  regulatory_context: string | null;
  created_at: string;
  updated_at: string;
}

// ============================================================================
// INDUSTRY TYPES
// ============================================================================

export interface Industry {
  id: number;
  name: string;
  naics_code?: string;
  short_code: string;
  profile_data: any;  // JSON object
  ai_adoption_rate?: number;
  avg_governance_maturity?: number;
  market_size_usd?: number;
  created_at: string;
  updated_at: string;
}

// ============================================================================
// USER & ORGANIZATION TYPES
// ============================================================================

export interface User {
  id: number;
  email: string;
  name: string;
  password_hash: string;
  role: 'admin' | 'assessor' | 'user';
  organization_id?: number;
  subscription_tier: 'free' | 'individual' | 'team' | 'premium' | 'enterprise';
  subscription_expires_at?: string;
  last_login_at?: string;
  created_at: string;
  updated_at: string;
}

export interface Organization {
  id: number;
  name: string;
  industry_id: number;
  size?: 'small' | 'medium' | 'large' | 'enterprise';
  country?: string;
  website?: string;
  subscription_tier: string;
  mrr?: number;
  created_at: string;
  updated_at: string;
}

// ============================================================================
// ASSESSMENT TYPES
// ============================================================================

export interface AssessmentScores {
  overall: number;
  domains: { [domain_id: number]: number };
  subdomains?: { [subdomain: string]: number };
}

export interface Assessment {
  id: number;
  organization_id: number;
  assessor_id: number;
  industry_id: number;
  status: 'in_progress' | 'completed' | 'archived';
  assessment_type: 'uari_plus' | 'bridge' | 'custom';
  scores?: AssessmentScores;
  percentile_rank?: number;
  maturity_level?: number;
  started_at: string;
  completed_at?: string;
  report_generated_at?: string;
  created_at: string;
  updated_at: string;
}

export interface Response {
  id: number;
  assessment_id: number;
  question_id: number;
  response_value: number;  // 1-5
  response_score: number;  // Calculated
  evidence?: any;  // JSON
  notes?: string;
  answered_at: string;
}

export interface Report {
  id: number;
  assessment_id: number;
  html_content: string;
  pdf_url?: string;
  report_version: string;
  page_count?: number;
  file_size_bytes?: number;
  generated_at: string;
}

// ============================================================================
// API REQUEST/RESPONSE TYPES
// ============================================================================

export interface CreateAssessmentRequest {
  organization_id: number;
  industry_id: number;
  assessment_type?: 'uari_plus' | 'bridge' | 'custom';
}

export interface SubmitResponseRequest {
  question_id: number;
  response_value: number;
  evidence?: any;
  notes?: string;
}

export interface ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: string;
  message?: string;
}

// ============================================================================
// QUERY RESULT TYPES
// ============================================================================

export interface DomainWithQuestionCount extends Domain {
  question_count: number;
}

export interface QuestionWithDomain extends Question {
  domain_name: string;
  domain_short_code: string;
}

export interface AssessmentWithDetails extends Assessment {
  organization_name: string;
  assessor_name: string;
  industry_name: string;
  response_count: number;
  completion_percentage: number;
}
