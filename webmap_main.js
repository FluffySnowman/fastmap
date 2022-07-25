const express = require("express");
  
const app = express();
  
app.listen(5000, () => {
  console.log(`Server is up and running on 5000 ...`);
});
  
app.get("/", (req, res) => {
  
    var data = "<h1>testing</h1>";
          
    res.send(data);
});