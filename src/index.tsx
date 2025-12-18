import { Hono } from 'hono'
import { cors } from 'hono/cors'
import { serveStatic } from 'hono/cloudflare-workers'
import type { Bindings } from './types'

// Import routes
import domains from './routes/domains'
import questions from './routes/questions'
import assessments from './routes/assessments'

const app = new Hono<{ Bindings: Bindings }>()

// Enable CORS for API routes
app.use('/api/*', cors())

// Serve static files from public/static/
app.use('/static/*', serveStatic({ root: './public' }))

// Mount API routes
app.route('/api/domains', domains)
app.route('/api/questions', questions)
app.route('/api/assessments', assessments)

// Health check
app.get('/api/health', (c) => {
  return c.json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    version: '1.0.0',
    database: 'connected'
  })
})

// Homepage - Simple dashboard
app.get('/', (c) => {
  return c.html(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ETHOS UARI+ Platform</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-50">
        <div class="min-h-screen">
            <!-- Header -->
            <header class="bg-gradient-to-r from-blue-600 to-indigo-700 text-white shadow-lg">
                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
                    <h1 class="text-4xl font-bold">
                        <i class="fas fa-shield-alt mr-3"></i>
                        ETHOS UARI+ Platform
                    </h1>
                    <p class="mt-2 text-blue-100">Universal AI Responsibility & Innovation Framework</p>
                </div>
            </header>

            <!-- Main Content -->
            <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
                <!-- Stats Grid -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center">
                            <div class="flex-shrink-0 bg-blue-500 rounded-md p-3">
                                <i class="fas fa-th-large text-white text-2xl"></i>
                            </div>
                            <div class="ml-4">
                                <p class="text-sm font-medium text-gray-500">Domains</p>
                                <p class="text-2xl font-semibold text-gray-900" id="domain-count">8</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center">
                            <div class="flex-shrink-0 bg-green-500 rounded-md p-3">
                                <i class="fas fa-question-circle text-white text-2xl"></i>
                            </div>
                            <div class="ml-4">
                                <p class="text-sm font-medium text-gray-500">Questions</p>
                                <p class="text-2xl font-semibold text-gray-900" id="question-count">247</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center">
                            <div class="flex-shrink-0 bg-purple-500 rounded-md p-3">
                                <i class="fas fa-industry text-white text-2xl"></i>
                            </div>
                            <div class="ml-4">
                                <p class="text-sm font-medium text-gray-500">Industries</p>
                                <p class="text-2xl font-semibold text-gray-900">29</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center">
                            <div class="flex-shrink-0 bg-orange-500 rounded-md p-3">
                                <i class="fas fa-chart-line text-white text-2xl"></i>
                            </div>
                            <div class="ml-4">
                                <p class="text-sm font-medium text-gray-500">Assessments</p>
                                <p class="text-2xl font-semibold text-gray-900" id="assessment-count">0</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Domains List -->
                <div class="bg-white rounded-lg shadow">
                    <div class="px-6 py-4 border-b border-gray-200">
                        <h2 class="text-xl font-semibold text-gray-900">
                            <i class="fas fa-th-large mr-2 text-blue-600"></i>
                            Assessment Domains
                        </h2>
                    </div>
                    <div id="domains-list" class="divide-y divide-gray-200">
                        <div class="px-6 py-8 text-center text-gray-500">
                            <i class="fas fa-spinner fa-spin text-3xl mb-3"></i>
                            <p>Loading domains...</p>
                        </div>
                    </div>
                </div>

                <!-- API Test Section -->
                <div class="mt-8 bg-white rounded-lg shadow">
                    <div class="px-6 py-4 border-b border-gray-200">
                        <h2 class="text-xl font-semibold text-gray-900">
                            <i class="fas fa-code mr-2 text-green-600"></i>
                            API Endpoints
                        </h2>
                    </div>
                    <div class="px-6 py-4">
                        <div class="space-y-3">
                            <div class="flex items-center justify-between p-3 bg-gray-50 rounded">
                                <code class="text-sm">GET /api/health</code>
                                <button onclick="testEndpoint('/api/health')" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 text-sm">
                                    <i class="fas fa-play mr-1"></i> Test
                                </button>
                            </div>
                            <div class="flex items-center justify-between p-3 bg-gray-50 rounded">
                                <code class="text-sm">GET /api/domains</code>
                                <button onclick="testEndpoint('/api/domains')" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 text-sm">
                                    <i class="fas fa-play mr-1"></i> Test
                                </button>
                            </div>
                            <div class="flex items-center justify-between p-3 bg-gray-50 rounded">
                                <code class="text-sm">GET /api/questions/domain/1</code>
                                <button onclick="testEndpoint('/api/questions/domain/1')" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 text-sm">
                                    <i class="fas fa-play mr-1"></i> Test
                                </button>
                            </div>
                        </div>
                        <div id="api-response" class="mt-4 hidden">
                            <h3 class="text-sm font-medium text-gray-700 mb-2">Response:</h3>
                            <pre class="bg-gray-900 text-green-400 p-4 rounded text-xs overflow-x-auto" id="response-content"></pre>
                        </div>
                    </div>
                </div>
            </main>

            <!-- Footer -->
            <footer class="bg-gray-800 text-gray-300 mt-12">
                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
                    <p class="text-center text-sm">
                        &copy; 2025 ETHOS UARI+ Platform | Comprehensive AI Assessment Framework | 247 Questions Across 8 Domains
                    </p>
                </div>
            </footer>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/axios@1.6.0/dist/axios.min.js"></script>
        <script>
            // Load domains on page load
            async function loadDomains() {
                try {
                    const response = await axios.get('/api/domains');
                    const domains = response.data.data;
                    
                    const domainsList = document.getElementById('domains-list');
                    domainsList.innerHTML = domains.map(domain => \`
                        <div class="px-6 py-4 hover:bg-gray-50 transition-colors">
                            <div class="flex items-center justify-between">
                                <div class="flex-1">
                                    <h3 class="text-lg font-semibold text-gray-900">
                                        \${domain.order_index}. \${domain.name}
                                    </h3>
                                    <p class="text-sm text-gray-600 mt-1">\${domain.description}</p>
                                    <div class="flex items-center mt-2 space-x-4 text-sm text-gray-500">
                                        <span>
                                            <i class="fas fa-question-circle mr-1"></i>
                                            \${domain.question_count} questions
                                        </span>
                                        <span>
                                            <i class="fas fa-weight mr-1"></i>
                                            Weight: \${domain.weight}
                                        </span>
                                    </div>
                                </div>
                                <button onclick="viewDomain(\${domain.id})" class="ml-4 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                                    View Questions
                                </button>
                            </div>
                        </div>
                    \`).join('');
                } catch (error) {
                    console.error('Failed to load domains:', error);
                    document.getElementById('domains-list').innerHTML = \`
                        <div class="px-6 py-8 text-center text-red-600">
                            <i class="fas fa-exclamation-triangle text-3xl mb-3"></i>
                            <p>Failed to load domains</p>
                        </div>
                    \`;
                }
            }

            function viewDomain(domainId) {
                window.location.href = \`/domain/\${domainId}\`;
            }

            async function testEndpoint(endpoint) {
                const responseDiv = document.getElementById('api-response');
                const responseContent = document.getElementById('response-content');
                
                try {
                    const response = await axios.get(endpoint);
                    responseContent.textContent = JSON.stringify(response.data, null, 2);
                    responseDiv.classList.remove('hidden');
                } catch (error) {
                    responseContent.textContent = JSON.stringify({
                        error: error.message,
                        response: error.response?.data
                    }, null, 2);
                    responseDiv.classList.remove('hidden');
                }
            }

            // Load domains when page loads
            document.addEventListener('DOMContentLoaded', loadDomains);
        </script>
    </body>
    </html>
  `)
})

export default app
