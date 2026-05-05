const http = require("http");
const os = require("os");
const client = require("prom-client");

const PORT = process.env.PORT || 3000;
const APP_ENV = process.env.APP_ENV || "unknown";
const HOSTNAME = os.hostname();

// Default system metrics (CPU, memory κλπ)
client.collectDefaultMetrics();

// Custom metric
const httpRequestCounter = new client.Counter({
  name: "http_requests_total",
  help: "Total number of HTTP requests",
  labelNames: ["method", "route", "env"],
});

const server = http.createServer(async (req, res) => {
  
  // 📊 Count requests
  httpRequestCounter.inc({
    method: req.method,
    route: req.url,
    env: APP_ENV,
  });

  // 🔥 Metrics endpoint
  if (req.url === "/metrics") {
    res.writeHead(200, { "Content-Type": client.register.contentType });
    res.end(await client.register.metrics());
    return;
  }

  // Normal response
  const response = `
Multi-Environment Deployment Platform

Environment: ${APP_ENV}
Hostname: ${HOSTNAME}
Port: ${PORT}
Message: Deployed via PR
`;

  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end(response);
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT} in ${APP_ENV} mode`);
});