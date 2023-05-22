const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();

global.__basedir = __dirname;
var corsOptions = {
  origin: "*",
};

app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.get("/", (req, res) => {
  res.send("Hello, World!");
});

require("./router/user.routes")(app);
require("./router/product.routes")(app);

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
