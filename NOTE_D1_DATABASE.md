# D1 Database Setup Note

## Production Database Creation
The command `npx wrangler d1 create ethos-uari-production` requires Cloudflare API credentials.

**For Production Deployment:**
1. Call `setup_cloudflare_api_key` tool to configure credentials
2. Run: `npx wrangler d1 create ethos-uari-production`
3. Copy the database_id to wrangler.jsonc

## Local Development (Current Approach)
For local development, we use `--local` flag which automatically creates a local SQLite database:
- Command: `npx wrangler d1 migrations apply ethos-uari-production --local`
- Database location: `.wrangler/state/v3/d1/`
- No credentials needed
- Perfect for development and testing

**Status:** ✅ Local development setup complete
**Next:** Create database migrations and apply locally
