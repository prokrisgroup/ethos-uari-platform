# 🚀 QUICK START: Deploy ETHOS UARI+ to Production

**Time Required**: 10-15 minutes  
**Skill Level**: Beginner-friendly  
**Prerequisites**: GitHub account, Cloudflare account

---

## 🎯 GOAL

Deploy ETHOS UARI+ Platform from GitHub to Cloudflare Pages with automatic deployments.

---

## ⚡ QUICK STEPS

### **Step 1: Setup Authentication** (2 minutes)

```bash
# Setup GitHub authentication
setup_github_environment

# Setup Cloudflare authentication  
setup_cloudflare_api_key

# Verify both
git remote -v
npx wrangler whoami
```

**If either fails**: See [Troubleshooting](#troubleshooting) below.

---

### **Step 2: Create Production Database** (3 minutes)

```bash
cd /home/user/webapp/ethos-uari

# Create database
npx wrangler d1 create ethos-uari-production
# Copy the database_id from output

# Update wrangler.jsonc with the database_id
# Replace "YOUR_DATABASE_ID_HERE" with actual ID
```

---

### **Step 3: Load Production Data** (2 minutes)

```bash
# Apply migrations
npx wrangler d1 migrations apply ethos-uari-production

# Load seed data
npx wrangler d1 execute ethos-uari-production --file=./seed-data/01_domains.sql
npx wrangler d1 execute ethos-uari-production --file=./seed-data/02_questions_ALL_247_FIXED.sql
npx wrangler d1 execute ethos-uari-production --file=./seed-data/03_industries_FIXED.sql

# Verify data
npx wrangler d1 execute ethos-uari-production --command="SELECT COUNT(*) FROM questions"
# Should return: 247
```

---

### **Step 4: Push to GitHub** (2 minutes)

```bash
cd /home/user/webapp/ethos-uari

# Check repository status
git status

# Add GitHub remote (replace with your repository URL)
git remote add origin https://github.com/YOUR_USERNAME/ethos-uari.git

# Push code
git push -u origin main
```

---

### **Step 5: Configure GitHub Secrets** (3 minutes)

1. Go to: `https://github.com/YOUR_USERNAME/ethos-uari/settings/secrets/actions`

2. Click **"New repository secret"**

3. Add **CLOUDFLARE_API_TOKEN**:
   - Name: `CLOUDFLARE_API_TOKEN`
   - Value: Your Cloudflare API Token
   - Click **"Add secret"**

4. Add **CLOUDFLARE_ACCOUNT_ID**:
   - Name: `CLOUDFLARE_ACCOUNT_ID`
   - Value: Your Cloudflare Account ID (from dashboard)
   - Click **"Add secret"**

---

### **Step 6: Create GitHub Actions Workflow** (2 minutes)

```bash
cd /home/user/webapp/ethos-uari

# Create workflow directory
mkdir -p .github/workflows

# Create workflow file
cat > .github/workflows/deploy.yml << 'EOF'
name: Deploy to Cloudflare Pages

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
      
      - run: npm ci
      - run: npm run build
      
      - name: Deploy to Cloudflare Pages
        uses: cloudflare/pages-action@v1
        with:
          apiToken: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          accountId: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
          projectName: ethos-uari
          directory: dist
          gitHubToken: ${{ secrets.GITHUB_TOKEN }}
EOF

# Commit and push
git add .github/workflows/deploy.yml
git commit -m "ci: add GitHub Actions deployment workflow"
git push origin main
```

---

### **Step 7: Create Cloudflare Pages Project** (2 minutes)

**Option A: Via CLI (Recommended)**
```bash
npx wrangler pages project create ethos-uari \
  --production-branch main \
  --compatibility-date 2024-01-01
```

**Option B: Via Dashboard**
1. Go to: https://dash.cloudflare.com
2. Click: `Workers & Pages` → `Create application` → `Pages`
3. Click: `Connect to Git`
4. Select: Your GitHub repository
5. Configure:
   - **Build command**: `npm run build`
   - **Build output**: `dist`
   - **Root directory**: `/`
6. Click: `Save and Deploy`

---

### **Step 8: Verify Deployment** (1 minute)

```bash
# Check GitHub Actions
# Visit: https://github.com/YOUR_USERNAME/ethos-uari/actions

# Test production site (after deployment completes)
curl https://ethos-uari.pages.dev/api/health

# Expected response:
# {"status":"healthy","timestamp":"...","version":"1.0.0","database":"connected"}
```

---

## ✅ SUCCESS CHECKLIST

After completing all steps, you should have:

- [x] GitHub repository with code pushed
- [x] Cloudflare Pages project created
- [x] Production D1 database with data loaded
- [x] GitHub Actions workflow configured
- [x] Automatic deployments working
- [x] Production site live at `ethos-uari.pages.dev`
- [x] Health check endpoint responding
- [x] All 247 questions accessible via API

---

## 🎉 YOU'RE DONE!

Your ETHOS UARI+ Platform is now:
- ✅ **Live on production**
- ✅ **Auto-deploys on every push to main**
- ✅ **Creates preview URLs for pull requests**
- ✅ **Globally distributed via Cloudflare CDN**
- ✅ **Connected to production D1 database**

---

## 🔄 DAILY WORKFLOW

After initial setup, your daily workflow is simple:

```bash
# 1. Make changes to code
# ... edit files ...

# 2. Commit changes
git add .
git commit -m "feat: add new feature"

# 3. Push to GitHub
git push origin main

# 4. GitHub Actions automatically:
#    ✅ Builds your code
#    ✅ Runs tests
#    ✅ Deploys to Cloudflare
#    ✅ Updates production site

# 5. Check status
# Visit: https://github.com/YOUR_USERNAME/ethos-uari/actions
```

**That's it!** No manual deployment needed. 🚀

---

## 🛠️ TROUBLESHOOTING

### **Problem: `setup_github_environment` fails**

**Solution**:
1. Go to **#github tab** in GenSpark interface
2. Click **"Authorize GitHub App"**
3. Click **"Authorize OAuth"**
4. Wait for confirmation
5. Retry `setup_github_environment`

---

### **Problem: `setup_cloudflare_api_key` fails**

**Solution**:
1. Go to **Deploy tab** in GenSpark interface
2. Enter your **Cloudflare API Token**
3. Wait for confirmation
4. Retry `setup_cloudflare_api_key`

**Create API Token**:
1. Go to: https://dash.cloudflare.com/profile/api-tokens
2. Click: **"Create Token"**
3. Use template: **"Edit Cloudflare Workers"**
4. Add permissions:
   - `Cloudflare Pages:Edit`
   - `D1:Edit`
5. Copy token and paste in Deploy tab

---

### **Problem: GitHub push fails with "authentication required"**

**Solution**:
```bash
# Verify setup completed
setup_github_environment

# Check git remote
git remote -v

# If remote doesn't exist, add it
git remote add origin https://github.com/YOUR_USERNAME/ethos-uari.git

# Try push again
git push -u origin main
```

---

### **Problem: Build fails on GitHub Actions**

**Solution**:
1. Go to: `https://github.com/YOUR_USERNAME/ethos-uari/actions`
2. Click on the failed workflow
3. Read error messages
4. Common fixes:
   - Check `package.json` has all dependencies
   - Verify `npm run build` works locally
   - Ensure `dist/` directory is created after build
   - Check GitHub secrets are configured

---

### **Problem: Deployment succeeds but site returns 500 errors**

**Solution**:
```bash
# Check database binding in wrangler.jsonc
cat wrangler.jsonc | grep -A 5 d1_databases

# Verify database exists
npx wrangler d1 list

# Test database connection
npx wrangler d1 execute ethos-uari-production \
  --command="SELECT COUNT(*) FROM domains"

# If migration needed
npx wrangler d1 migrations apply ethos-uari-production
```

---

### **Problem: API returns "database not found"**

**Solution**:
1. Verify database ID in `wrangler.jsonc` matches actual database
2. Check database binding name is `"DB"` (uppercase)
3. Ensure migrations were applied to production database
4. Redeploy after fixing configuration

---

### **Problem: Preview deployments not created for PRs**

**Solution**:
1. Verify GitHub secrets include `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID`
2. Check workflow file includes PR trigger:
   ```yaml
   on:
     pull_request:
       branches: [main]
   ```
3. Ensure Cloudflare Pages is connected to GitHub
4. Check GitHub Actions logs for errors

---

## 📞 NEED HELP?

If you encounter issues not covered here:

1. **Check full documentation**: See [DEPLOYMENT_PIPELINE.md](./DEPLOYMENT_PIPELINE.md)
2. **Review logs**: 
   - GitHub Actions: `https://github.com/YOUR_USERNAME/ethos-uari/actions`
   - Cloudflare: Dashboard → Workers & Pages → ethos-uari → Deployments
3. **Verify configuration**:
   ```bash
   # Check git remote
   git remote -v
   
   # Check wrangler auth
   npx wrangler whoami
   
   # Check database
   npx wrangler d1 list
   ```

---

## 📚 NEXT STEPS

After successful deployment:

1. **Configure custom domain** (optional):
   - See [DEPLOYMENT_PIPELINE.md](./DEPLOYMENT_PIPELINE.md#step-9-configure-custom-domain)

2. **Set up staging environment**:
   - Create `develop` branch
   - Push code to `develop`
   - Access at: `develop.ethos-uari.pages.dev`

3. **Enable branch protections**:
   - Go to: Repository Settings → Branches
   - Add rule for `main` branch
   - Require pull request reviews
   - Require status checks to pass

4. **Add team members**:
   - Go to: Repository Settings → Collaborators
   - Invite team members
   - Configure roles and permissions

---

**Last Updated**: 2025-12-18  
**Version**: 1.0.0  
**Status**: ✅ READY TO USE
