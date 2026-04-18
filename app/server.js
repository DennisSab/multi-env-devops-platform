const http = require("http");
const os = require("os");

const PORT = process.env.PORT || 3000;
const APP_ENV = process.env.APP_ENV || "unknown";
const HOSTNAME = os.hostname();

const server = http.createServer((req, res) => {
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
