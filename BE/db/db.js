const mysql = require("mysql2");

// Create a connection
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "warehouse",
  multipleStatements: true,
});

// Connect to the database
connection.connect((err) => {
  if (err) {
    console.error("Error connecting to database:", err);
    return;
  }
  console.log("Connected to the database");
});

module.exports = connection;
