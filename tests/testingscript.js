//a function to return a specified command from a command variable into the terminal using spawn

function netmap0x1(arguments1) {
    const { spawn } = require("child_process");
    const netmap = spawn("ping", [arguments1]);
    netmap.stdout.on("data", (data) => {
      console.log(`stdout: ${data}`);
    });
    netmap.stderr.on("data", (data) => {
      console.error(`stderr: ${data}`);
    });
    netmap.on("close", (code) => {
      console.log(`child process exited with code ${code}`);
    });
  }
  
  module.exports = { netmap0x1 };