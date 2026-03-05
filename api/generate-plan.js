// Vercel serverless function — proxies Anthropic API calls so the browser
// never needs to hold the API key. The key is stored safely in Vercel's
// Environment Variables (Settings → Environment Variables in Vercel dashboard).

module.exports = async function(req, res) {
  // Allow browser requests from any origin (CORS)
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  // Handle browser "preflight" check
  if (req.method === 'OPTIONS') return res.status(200).end();

  // Only accept POST requests
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  // Read the API key from Vercel environment variables
  const apiKey = process.env.CLAUDE_API_KEY;
  if (!apiKey) {
    return res.status(500).json({
      error: 'CLAUDE_API_KEY not set. Add it in Vercel → Project Settings → Environment Variables.',
    });
  }

  try {
    const { prompt } = req.body; // Vercel auto-parses JSON bodies
    if (!prompt) return res.status(400).json({ error: 'Missing prompt' });

    // Call Anthropic's Claude API from the server (not the browser)
    const response = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: 'claude-sonnet-4-6',
        max_tokens: 6000,
        messages: [{ role: 'user', content: prompt }],
      }),
    });

    const data = await response.json();
    if (!response.ok) {
      // Build a helpful error message from the Anthropic response
      const errType = data.error?.type || '';
      const errMsg = data.error?.message || `Anthropic API error ${response.status}`;
      const friendlyMsg = response.status === 401
        ? 'API key is invalid or revoked. Please generate a new key at console.anthropic.com and update it in Vercel environment variables.'
        : `${errType ? errType + ': ' : ''}${errMsg}`;
      return res.status(response.status).json({ error: friendlyMsg });
    }

    return res.status(200).json(data);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
};
