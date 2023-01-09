const express = require("express");
const { spawn } = require("child_process");
const path = require('path');
const { netmap0x1 } = require("./testingscript");
const app = express();
const router = express.Router();

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '/views/index.html'));
});

//send the out of the netmap0x1 to index.html using the router into the content div
router.get("/netmap0x1", function (req, res) {
  res.sendFile(path.join(__dirname, "/views/index.html"));
  const netmap = spawn("ping", ["google.com"]);
  netmap.stdout.on("data", (data) => {
    console.log(`stdout: ${data}`);
    res.send(`<div id="content">${data}</div>`);
  });
  netmap.stderr.on("data", (data) => {
    console.error(`stderr: ${data}`);
  });
  netmap.on("close", (code) => {
    console.log(`child process exited with code ${code}`);
  });
});

app.use('/', router);
app.listen(process.env.port || 12345);

console.log("Running at Port 12345");

console.log("Fastmap running on 127.0.0.1:12345");
