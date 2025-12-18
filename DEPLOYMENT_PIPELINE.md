# 🚀 ETHOS UARI+ AUTOMATED DEPLOYMENT PIPELINE
## GitHub → Cloudflare Pages Integration

**Last Updated**: 2025-12-18  
**Version**: 1.0.0  
**Status**: ✅ Ready for Implementation

---

## 📋 TABLE OF CONTENTS

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Prerequisites](#prerequisites)
4. [Setup Steps](#setup-steps)
5. [GitHub Actions Workflow](#github-actions-workflow)
6. [Cloudflare Pages Configuration](#cloudflare-pages-configuration)
7. [Deployment Process](#deployment-process)
8. [Rollback Procedures](#rollback-procedures)
9. [Troubleshooting](#troubleshooting)

---

## 🎯 OVERVIEW

This document describes the **fully automated CI/CD pipeline** that deploys the ETHOS UARI+ Platform directly from GitHub to Cloudflare Pages without requiring manual intervention or sandbox environments.

### **Deployment Flow**
```
Local Development → Git Commit → GitHub Push → Automatic Deployment → Live Production
                                       ↓
                                  GitHub Actions
                                  (Build & Test)
                                       ↓
                                Cloudflare Pages
                                (Auto-Deploy)
```

### **Key Benefits**
✅ **Zero Manual Deployment**: Push code, deployment happens automatically  
✅ **Branch Previews**: Every PR gets a unique preview URL  
✅ **Instant Rollback**: One-click rollback to previous versions  
✅ **Build Logs**: Full visibility into deployment process  
✅ **Environment Separation**: Production, staging, and preview environments  
✅ **Database Migrations**: Automatic migration application on deploy  

---

## 🏗️ ARCHITECTURE

### **Components**

1. **GitHub Repository** 
   - Source code hosting
   - Version control
   - Pull request management
   - Branch protection rules

2. **GitHub Actions** (CI/CD Pipeline)
   - Automated testing on PR
   - Build verification
   - Deployment automation
   - Environment-specific workflows

3. **Cloudflare Pages** (Deployment Platform)
   - Edge deployment (global CDN)
   - Automatic builds from GitHub
   - Preview deployments
   - Production deployments
   - D1 database integration

4. **Cloudflare D1** (Database)
   - Production database
   - Automatic migrations
   - Global distribution

### **Deployment Environments**

| Environment | Branch | URL Pattern | Purpose |
|-------------|--------|-------------|---------|
| **Production** | `main` | `ethos-uari.pages.dev` | Live production site |
| **Staging** | `develop` | `develop.ethos-uari.pages.dev` | Pre-production testing |
| **Preview** | PR branches | `pr-123.ethos-uari.pages.dev` | PR review environments |

---

## ✅ PREREQUISITES

### **1. GitHub Account & Repository**
- GitHub account with repository access
- Repository permissions: `Admin` or `Write`
- GitHub Personal Access Token (PAT) with scopes:
  - `repo` - Full control of private repositories
  - `workflow` - Update GitHub Action workflows
  - `write:packages` - Upload packages to GitHub Package Registry

**Create Token**: https://github.com/settings/tokens/new

### **2. Cloudflare Account**
- Active Cloudflare account
- Cloudflare API Token with permissions:
  - `Cloudflare Pages:Edit` - Required for deployments
  - `D1:Edit` - Required for database operations
  
**Create Token**: https://dash.cloudflare.com/profile/api-tokens

### **3. Cloudflare D1 Database**
- Production database created: `ethos-uari-production`
- Database ID from `npx wrangler d1 create ethos-uari-production`

### **4. Domain (Optional)**
- Custom domain configured in Cloudflare
- DNS records pointing to Cloudflare Pages

---

## 🛠️ SETUP STEPS

### **Step 1: Setup GitHub Environment** (REQUIRED)

```bash
# In sandbox or local environment
# This configures GitHub authentication globally
setup_github_environment

# Verify authentication
cd /home/user/webapp/ethos-uari
git remote -v
```

**If setup_github_environment fails:**
- Go to #github tab in GenSpark interface
- Complete GitHub App authorization
- Complete OAuth authorization
- Retry setup_github_environment

### **Step 2: Setup Cloudflare API Key** (REQUIRED)

```bash
# This configures Cloudflare API authentication
setup_cloudflare_api_key

# Verify authentication
npx wrangler whoami
```

**If setup_cloudflare_api_key fails:**
- Go to Deploy tab in GenSpark interface
- Enter your Cloudflare API Token
- Retry setup_cloudflare_api_key

### **Step 3: Create Production D1 Database**

```bash
cd /home/user/webapp/ethos-uari

# Create production database
npx wrangler d1 create ethos-uari-production

# Output will show database_id like:
# database_id = "xxxx-xxxx-xxxx-xxxx"

# Copy the database_id to wrangler.jsonc
```

**Update wrangler.jsonc:**
```jsonc
{
  "name": "ethos-uari",
  "main": "src/index.tsx",
  "compatibility_date": "2024-01-01",
  "compatibility_flags": ["nodejs_compat"],
  "pages_build_output_dir": "./dist",
  "d1_databases": [
    {
      "binding": "DB",
      "database_name": "ethos-uari-production",
      "database_id": "YOUR_DATABASE_ID_HERE"  // Replace with actual ID
    }
  ]
}
```

### **Step 4: Apply Migrations to Production Database**

```bash
# Apply migrations to production database
npx wrangler d1 migrations apply ethos-uari-production

# Load seed data (domains, questions, industries)
npx wrangler d1 execute ethos-uari-production --file=./seed-data/01_domains.sql
npx wrangler d1 execute ethos-uari-production --file=./seed-data/02_questions_ALL_247_FIXED.sql
npx wrangler d1 execute ethos-uari-production --file=./seed-data/03_industries_FIXED.sql

# Verify data loaded
npx wrangler d1 execute ethos-uari-production --command="SELECT COUNT(*) FROM domains"
npx wrangler d1 execute ethos-uari-production --command="SELECT COUNT(*) FROM questions"
npx wrangler d1 execute ethos-uari-production --command="SELECT COUNT(*) FROM industries"
```

### **Step 5: Create GitHub Repository Secrets**

Add the following secrets to your GitHub repository:

1. **Go to Repository Settings**
   - Navigate to: `Settings` → `Secrets and variables` → `Actions`
   - Click `New repository secret`

2. **Add Cloudflare API Token**
   - Name: `CLOUDFLARE_API_TOKEN`
   - Value: Your Cloudflare API Token
   - Click `Add secret`

3. **Add Cloudflare Account ID**
   - Name: `CLOUDFLARE_ACCOUNT_ID`
   - Value: Your Cloudflare Account ID (from dashboard)
   - Click `Add secret`

### **Step 6: Create GitHub Actions Workflow**

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Cloudflare Pages

on:
  push:
    branches:
      - main      # Production deployments
      - develop   # Staging deployments
  pull_request:
    branches:
      - main      # Preview deployments for PRs

jobs:
  deploy:
    runs-on: ubuntu-latest
    name: Deploy to Cloudflare Pages
    
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Build
        run: npm run build

      - name: Apply D1 Migrations (Production)
        if: github.ref == 'refs/heads/main'
        run: |
          npx wrangler d1 migrations apply ethos-uari-production \
            --env production
        env:
          CLOUDFLARE_API_TOKEN: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          CLOUDFLARE_ACCOUNT_ID: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}

      - name: Deploy to Cloudflare Pages
        uses: cloudflare/pages-action@v1
        with:
          apiToken: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          accountId: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
          projectName: ethos-uari
          directory: dist
          gitHubToken: ${{ secrets.GITHUB_TOKEN }}
          branch: ${{ github.head_ref || github.ref_name }}

      - name: Comment PR with Preview URL
        if: github.event_name == 'pull_request'
        uses: actions/github-script@v6
        with:
          script: |
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: '🚀 Preview deployment ready at: https://${{ github.head_ref }}.ethos-uari.pages.dev'
            })
```

### **Step 7: Create Cloudflare Pages Project**

```bash
cd /home/user/webapp/ethos-uari

# Create Cloudflare Pages project
npx wrangler pages project create ethos-uari \
  --production-branch main \
  --compatibility-date 2024-01-01

# Connect to GitHub repository
# Follow the prompts to authorize Cloudflare to access your GitHub account
```

**Alternative: Create via Cloudflare Dashboard**
1. Go to https://dash.cloudflare.com
2. Navigate to `Workers & Pages` → `Create application`
3. Click `Pages` → `Connect to Git`
4. Select your GitHub repository
5. Configure build settings:
   - **Build command**: `npm run build`
   - **Build output directory**: `dist`
   - **Root directory**: `/`
   - **Environment variables**: (none needed for basic setup)

### **Step 8: Configure Branch Deployments**

In Cloudflare Pages dashboard:
1. Go to your project settings
2. Navigate to `Build & deployments`
3. Configure **Production branch**: `main`
4. Enable **Preview deployments**: All branches
5. Configure **Build configuration**:
   ```
   Build command: npm run build
   Build output directory: /dist
   Root directory: /
   ```

### **Step 9: Set Environment Variables (Optional)**

If you have environment-specific configuration:

1. In Cloudflare Pages dashboard
2. Navigate to `Settings` → `Environment variables`
3. Add variables for:
   - **Production**: Variables for `main` branch
   - **Preview**: Variables for all other branches

Example variables:
```
NODE_ENV=production
API_BASE_URL=https://api.ethos-uari.com
```

---

## 🔄 GITHUB ACTIONS WORKFLOW

### **Workflow Triggers**

| Event | Branch | Action | Result |
|-------|--------|--------|--------|
| Push | `main` | Deploy to production | Live site updated |
| Push | `develop` | Deploy to staging | Staging site updated |
| PR opened | any → `main` | Deploy preview | Preview URL created |
| PR updated | any → `main` | Update preview | Preview URL updated |
| PR merged | any → `main` | Deploy production | Production deployed |

### **Workflow Steps**

1. **Checkout Code**: Clone repository
2. **Setup Node.js**: Install Node.js 18
3. **Install Dependencies**: Run `npm ci`
4. **Build Project**: Run `npm run build`
5. **Apply Migrations**: Run D1 migrations (production only)
6. **Deploy to Pages**: Upload `dist/` to Cloudflare
7. **Comment PR**: Add preview URL to PR (PRs only)

### **Build Output**

After successful build, the `dist/` directory contains:
- `_worker.js` - Compiled Hono application
- `_routes.json` - Routing configuration
- Static assets from `public/` directory

---

## ☁️ CLOUDFLARE PAGES CONFIGURATION

### **Project Settings**

```
Project Name: ethos-uari
Production Branch: main
Build Command: npm run build
Build Output: dist
Root Directory: /
Framework Preset: None
```

### **Build Configuration**

```json
{
  "build": {
    "command": "npm run build",
    "cwd": "/",
    "watch_paths": ["src/**", "public/**", "migrations/**"]
  },
  "deploy": {
    "command": "echo 'Deploying to Cloudflare Pages'",
    "cwd": "/"
  }
}
```

### **Environment Variables**

**Production**:
```
NODE_ENV=production
DATABASE_NAME=ethos-uari-production
```

**Preview**:
```
NODE_ENV=preview
DATABASE_NAME=ethos-uari-production-preview
```

---

## 🚢 DEPLOYMENT PROCESS

### **Manual Deployment** (From Sandbox or Local)

```bash
# 1. Ensure you're on the correct branch
git checkout main

# 2. Build the project
npm run build

# 3. Apply migrations to production
npx wrangler d1 migrations apply ethos-uari-production

# 4. Deploy to Cloudflare Pages
npx wrangler pages deploy dist --project-name ethos-uari

# 5. Verify deployment
curl https://ethos-uari.pages.dev/api/health
```

### **Automatic Deployment** (Push to GitHub)

```bash
# 1. Make your changes
# ... edit files ...

# 2. Commit changes
git add .
git commit -m "feat: add new feature"

# 3. Push to GitHub
git push origin main

# 4. GitHub Actions automatically:
#    - Runs tests
#    - Builds project
#    - Applies migrations
#    - Deploys to Cloudflare
#    - Reports status

# 5. Check deployment status
# Visit: https://github.com/YOUR_USERNAME/ethos-uari/actions
```

### **Preview Deployment** (Pull Request)

```bash
# 1. Create feature branch
git checkout -b feature/new-assessment-flow

# 2. Make changes and commit
git add .
git commit -m "feat: implement new assessment flow"

# 3. Push branch
git push origin feature/new-assessment-flow

# 4. Create Pull Request on GitHub
# - Go to GitHub repository
# - Click "Pull requests" → "New pull request"
# - Select your branch
# - Click "Create pull request"

# 5. GitHub Actions automatically:
#    - Builds preview
#    - Deploys to unique URL
#    - Comments PR with URL

# 6. Access preview
# URL will be: https://feature-new-assessment-flow.ethos-uari.pages.dev
```

---

## ⏮️ ROLLBACK PROCEDURES

### **Rollback to Previous Deployment**

**Via Cloudflare Dashboard:**
1. Go to https://dash.cloudflare.com
2. Navigate to `Workers & Pages` → `ethos-uari`
3. Click `Deployments` tab
4. Find the previous successful deployment
5. Click `···` menu → `Rollback to this deployment`
6. Confirm rollback

**Via Wrangler CLI:**
```bash
# List recent deployments
npx wrangler pages deployment list --project-name ethos-uari

# Rollback to specific deployment
npx wrangler pages deployment rollback \
  --project-name ethos-uari \
  --deployment-id <DEPLOYMENT_ID>
```

### **Rollback Database Migrations**

**If migration causes issues:**

```bash
# 1. Check migration history
npx wrangler d1 migrations list ethos-uari-production

# 2. Create rollback migration
# Create new migration file: migrations/XXXX_rollback.sql
# Add SQL to undo previous migration

# 3. Apply rollback migration
npx wrangler d1 migrations apply ethos-uari-production

# 4. Verify database state
npx wrangler d1 execute ethos-uari-production \
  --command="SELECT * FROM d1_migrations ORDER BY id DESC LIMIT 5"
```

### **Emergency Rollback (Git Revert)**

```bash
# 1. Find commit to revert
git log --oneline

# 2. Revert specific commit
git revert <COMMIT_HASH>

# 3. Push revert
git push origin main

# 4. GitHub Actions will automatically deploy the reverted version
```

---

## 🔧 TROUBLESHOOTING

### **Common Issues & Solutions**

#### **Issue 1: GitHub Authentication Failed**

**Error**: `setup_github_environment` fails with authentication error

**Solution**:
1. Go to #github tab in GenSpark interface
2. Complete GitHub App authorization
3. Complete OAuth authorization  
4. Retry `setup_github_environment`

#### **Issue 2: Cloudflare Authentication Failed**

**Error**: `setup_cloudflare_api_key` fails or `wrangler whoami` returns error

**Solution**:
1. Go to Deploy tab in GenSpark interface
2. Enter valid Cloudflare API Token
3. Verify token has `Cloudflare Pages:Edit` and `D1:Edit` permissions
4. Retry `setup_cloudflare_api_key`

#### **Issue 3: Build Fails with "Module not found"**

**Error**: Build fails during `npm run build`

**Solution**:
```bash
# Clean install dependencies
rm -rf node_modules package-lock.json
npm install

# Rebuild
npm run build
```

#### **Issue 4: D1 Database Not Accessible**

**Error**: Deployment succeeds but API returns database errors

**Solution**:
```bash
# Verify database binding in wrangler.jsonc
cat wrangler.jsonc | grep -A 5 d1_databases

# Test database connection
npx wrangler d1 execute ethos-uari-production \
  --command="SELECT COUNT(*) FROM domains"

# Apply migrations if needed
npx wrangler d1 migrations apply ethos-uari-production
```

#### **Issue 5: Preview Deployment Not Created**

**Error**: PR opened but no preview deployment

**Solution**:
1. Check GitHub Actions workflow status
2. Verify Cloudflare Pages is connected to GitHub
3. Check repository secrets are configured correctly
4. Review GitHub Actions logs for errors

#### **Issue 6: Static Files 404**

**Error**: `/static/app.js` returns 404 on production

**Solution**:
1. Verify files exist in `public/static/` directory
2. Check build output: `ls -la dist/static/`
3. Verify `serveStatic` is configured in `src/index.tsx`:
   ```typescript
   import { serveStatic } from 'hono/cloudflare-workers'
   app.use('/static/*', serveStatic({ root: './public' }))
   ```
4. Rebuild and redeploy

---

## 📊 DEPLOYMENT MONITORING

### **Check Deployment Status**

**Via GitHub Actions:**
```
https://github.com/YOUR_USERNAME/ethos-uari/actions
```

**Via Cloudflare Dashboard:**
```
https://dash.cloudflare.com → Workers & Pages → ethos-uari → Deployments
```

### **View Build Logs**

**GitHub Actions Logs:**
1. Go to repository → Actions tab
2. Click on specific workflow run
3. Click on job name
4. View detailed logs

**Cloudflare Logs:**
1. Go to Cloudflare Pages project
2. Click on specific deployment
3. View build logs

### **Monitor Application Health**

```bash
# Production health check
curl https://ethos-uari.pages.dev/api/health

# Staging health check
curl https://develop.ethos-uari.pages.dev/api/health

# Check API endpoints
curl https://ethos-uari.pages.dev/api/domains
curl https://ethos-uari.pages.dev/api/questions
```

---

## 📚 ADDITIONAL RESOURCES

### **Documentation**
- **GitHub Actions**: https://docs.github.com/en/actions
- **Cloudflare Pages**: https://developers.cloudflare.com/pages
- **Cloudflare D1**: https://developers.cloudflare.com/d1
- **Wrangler CLI**: https://developers.cloudflare.com/workers/wrangler

### **Tools**
- **GitHub Token**: https://github.com/settings/tokens/new
- **Cloudflare API**: https://dash.cloudflare.com/profile/api-tokens
- **Cloudflare Dashboard**: https://dash.cloudflare.com

### **Support**
- **GitHub Issues**: Create issue in repository
- **Cloudflare Support**: https://dash.cloudflare.com → Support
- **Community Discord**: [Your Discord link]

---

## ✅ DEPLOYMENT CHECKLIST

Before deploying to production, ensure:

- [ ] `setup_github_environment` completed successfully
- [ ] `setup_cloudflare_api_key` completed successfully
- [ ] Production D1 database created and ID added to `wrangler.jsonc`
- [ ] Migrations applied to production database
- [ ] Seed data loaded (domains, questions, industries)
- [ ] GitHub repository secrets configured
- [ ] GitHub Actions workflow file created (`.github/workflows/deploy.yml`)
- [ ] Cloudflare Pages project created
- [ ] Production branch set to `main`
- [ ] Build command configured: `npm run build`
- [ ] Build output set to: `dist`
- [ ] Test deployment successful
- [ ] Health check endpoint returns 200
- [ ] API endpoints tested and working
- [ ] Custom domain configured (if applicable)
- [ ] README.md updated with production URLs

---

## 📄 VERSION HISTORY

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2025-12-18 | Initial deployment pipeline documentation |

---

**Document Status**: ✅ CURRENT  
**Next Review**: When major deployment changes occur  
**Owner**: Georgios (Gwyr Films & Cinematic Pictures)
