const express = require("express");
  
const app = express();
  
app.listen(5000, () => {
  console.log(`Fastmap web gui version is running on port 5000 on localhost (127.0.0.1:5000)`);
});
  
app.get("/", (req, res) => {
  
    var data = "<h1>testing</h1>";
          
    res.send(data);
});