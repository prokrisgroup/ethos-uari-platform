# ETHOS UARI+ Platform

## 🎯 Project Overview

**ETHOS UARI+** is a comprehensive Universal AI Responsibility & Innovation assessment platform designed to evaluate AI systems across 8 critical ethical domains using 247 detailed questions with a 5-level maturity framework.

### Key Features
- **8 Assessment Domains**: Comprehensive coverage of AI ethics and governance
- **247 Questions**: Complete assessment framework with full detail
- **5-Level Maturity Model**: Evidence-based scoring from Level 1 to Level 5
- **29 Industry Profiles**: Industry-specific variations and recommendations
- **Evidence-Based**: Detailed requirements and assessor guidance
- **API-First Architecture**: RESTful API for all operations
- **Modern UI**: Responsive TailwindCSS dashboard

---

## 🌐 Live URLs

### Development Server
- **Dashboard**: https://3000-ioodhxcka5oo5gestb7mg-02b9cc79.sandbox.novita.ai
- **API Health**: https://3000-ioodhxcka5oo5gestb7mg-02b9cc79.sandbox.novita.ai/api/health
- **Status**: ✅ **ONLINE**

### GitHub Repository
- **Repository**: (To be configured)
- **Status**: Local repository initialized, ready for push

---

## 📊 Data Architecture

### Core Tables (8)
1. **domains** - 8 assessment domains
2. **questions** - 247 complete questions with metadata
3. **industries** - 29 industry profiles (in progress)
4. **users** - Platform users and assessors
5. **organizations** - Organizations being assessed
6. **assessments** - Assessment instances
7. **responses** - Question responses with evidence
8. **reports** - Generated assessment reports

### Storage Services
- **Database**: Cloudflare D1 (SQLite-based, globally distributed)
- **Local Development**: SQLite database in `.wrangler/state/v3/d1/`
- **Production**: Cloudflare D1 production database (configured)

### Data Distribution
- **Domain 1** (Ethical Leadership): 20 questions (8.1%)
- **Domain 2** (Purpose-Driven Innovation): 25 questions (10.1%)
- **Domain 3** (Human-Centricity): 22 questions (8.9%)
- **Domain 4** (Safety & Reliability): 20 questions (8.1%)
- **Domain 5** (Data Governance): 40 questions (16.2%)
- **Domain 6** (Transparency): 40 questions (16.2%)
- **Domain 7** (Social Impact): 40 questions (16.2%)
- **Domain 8** (Environmental): 40 questions (16.2%)
- **Total**: 247 questions (100%)

---

## 🚀 API Endpoints

### Health Check
```bash
GET /api/health
# Returns system status and database connectivity
```

### Domains API
```bash
GET /api/domains
# List all 8 domains with question counts

GET /api/domains/:id
# Get specific domain details
```

### Questions API
```bash
GET /api/questions
# List all questions (with optional filters: criticality, limit, offset)

GET /api/questions/:code
# Get specific question by code (e.g., D1-Q001)

GET /api/questions/domain/:domainId
# Get all questions for a specific domain
```

### Assessments API
```bash
POST /api/assessments
# Create new assessment

GET /api/assessments/:id
# Get assessment with all responses

GET /api/assessments/organization/:orgId
# List assessments for organization

PUT /api/assessments/:id/responses
# Submit or update question responses

POST /api/assessments/:id/calculate
# Calculate assessment scores
```

---

## 👥 User Guide

### For Assessors

1. **Access the Platform**
   - Navigate to the live dashboard URL
   - View domain overview and statistics

2. **Create an Assessment**
   - POST to `/api/assessments` with organization details
   - Receive assessment ID for tracking

3. **Complete Questions**
   - Retrieve questions by domain
   - Submit responses with evidence URLs
   - Track completion progress

4. **Calculate Scores**
   - POST to calculate endpoint when complete
   - Receive domain and overall scores
   - View maturity level breakdown

### For Organizations

1. **View Your Assessments**
   - Access via organization ID
   - See completion status and scores

2. **Track Progress**
   - Monitor completed vs. total questions
   - View domain-by-domain progress

3. **Access Reports**
   - Generate comprehensive assessment reports
   - Download evidence and recommendations

---

## 💻 Development

### Prerequisites
- Node.js 18+
- npm or pnpm
- Wrangler CLI

### Local Development
```bash
# Install dependencies
npm install

# Build the project
npm run build

# Start development server
npm run dev:d1

# Alternative: Start with PM2
pm2 start ecosystem.config.cjs
```

### Database Management
```bash
# Apply migrations locally
npm run db:migrate:local

# Apply migrations to production
npm run db:migrate:prod

# Seed test data
npm run db:seed

# Reset local database
npm run db:reset

# Database console (local)
npm run db:console:local
```

### Git Operations
```bash
# Initialize repository
npm run git:init

# Commit changes
npm run git:commit "Your message"

# Check status
npm run git:status
```

---

## 🏗️ Project Structure

```
ethos-uari/
├── src/
│   ├── index.tsx              # Main Hono app
│   ├── types.ts               # TypeScript types
│   └── routes/
│       ├── domains.ts         # Domains API
│       ├── questions.ts       # Questions API
│       └── assessments.ts     # Assessments API
├── migrations/
│   ├── 0001_initial_schema.sql
│   └── 0002_indexes.sql
├── seed-data/
│   ├── 01_domains.sql
│   └── 02_questions_ALL_247_FIXED.sql
├── public/                    # Static assets
├── dist/                      # Build output
├── wrangler.jsonc             # Cloudflare config
├── ecosystem.config.cjs       # PM2 config
├── package.json
├── tsconfig.json
└── README.md
```

---

## 📦 Deployment

### Platform: Cloudflare Pages
### Status: Development (Local D1)
### Tech Stack:
- **Backend**: Hono + TypeScript + Cloudflare Workers
- **Database**: Cloudflare D1 (SQLite)
- **Build**: Vite
- **Process Manager**: PM2 (development)

### Deployment Commands
```bash
# Build for production
npm run build

# Deploy to Cloudflare Pages
npm run deploy:prod

# Preview deployment
npm run preview
```

---

## 📋 Current Status

### ✅ Completed (Phase 1, Week 1, Day 2)
- [x] Project foundation setup
- [x] Database schema design (8 tables, 39 indexes)
- [x] Complete question bank generation (247 questions)
- [x] Data loading and verification
- [x] Full API backend implementation
- [x] Interactive frontend dashboard
- [x] PM2 configuration
- [x] Git version control

### 🚧 In Progress (Phase 1, Week 1, Day 3)
- [ ] Industry profiles import (29 industries)
- [ ] Assessment workflow UI
- [ ] Score visualization
- [ ] Report generation

### 📅 Upcoming
- [ ] User authentication
- [ ] Role-based access control
- [ ] Advanced filtering and search
- [ ] Export functionality
- [ ] Analytics dashboard

---

## 🎯 Milestones

- **Checkpoint 1**: Strategic Foundation ✅
- **Checkpoint 2**: Database Schema ✅
- **Checkpoint 3**: Complete Question Bank (247) ✅
- **Checkpoint 4**: API + Frontend ✅
- **Checkpoint 5**: Industry Profiles (pending)
- **Checkpoint 6**: Assessment Workflow (pending)

---

## 📊 Progress Metrics

- **Phase 1 Progress**: 32/148 tasks (21.6%)
- **Overall Progress**: 32/367 tasks (8.7%)
- **Questions Completed**: 247/247 (100%)
- **Domains Completed**: 8/8 (100%)
- **API Endpoints**: 11/11 (100%)

---

## 📚 Documentation

- **Strategic Blueprint**: Available in backups
- **Technical Architecture**: Cloudflare Pages + D1
- **Implementation Roadmap**: 367 granular tasks
- **Audit Package**: Complete 247-question framework
- **Status Reports**: Checkpoint documents

---

## 🔗 Resources & Backups

1. **Strategic Package**: https://www.genspark.ai/api/files/s/3LqS0FOO
2. **Checkpoint 1**: https://www.genspark.ai/api/files/s/fO3zM1Fs
3. **Checkpoint 2**: https://www.genspark.ai/api/files/s/XYGYm5y8
4. **Checkpoint 3** (247 Questions): https://www.genspark.ai/api/files/s/w91Okpgm
5. **Revised Audit Package**: https://www.genspark.ai/api/files/s/wnUDXBCD
6. **Checkpoint 4** (API + Frontend): https://www.genspark.ai/api/files/s/ic0xiYrE

---

## 👥 Team

**Founder & Business Owner**: Georgios  
**Organizations**: Gwyr Films (www.gwyrfilms.com) | Cinematic Pictures (www.cinematic.pictures)  
**Role**: Research Scientist, Innovation Incubator, AI Ethicist  

---

## 📄 License

Proprietary - All Rights Reserved  
© 2025 Gwyr Films & Cinematic Pictures

---

## 📞 Contact

For inquiries about the ETHOS UARI+ Platform:
- **Website**: www.gwyrfilms.com
- **Portfolio**: www.cinematic.pictures

---

**Last Updated**: 2025-12-18  
**Version**: 1.0.0  
**Status**: ✅ CHECKPOINT 4 COMPLETE - Development Active
