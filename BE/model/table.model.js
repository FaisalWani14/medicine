const sql = require("../db/db");

const Table = {};

Table.getTableName = (name, result) => {
  sql.query("SELECT * FROM " + name + "", (err, res) => {
    if (err) {
      console.log("Query error: " + err);
      result(err, null);
      return;
    }
    result(null, res);
  });
};

Table.insert = (name, col, data, result) => {
  const sqlQuery = `INSERT INTO ${name} (${col.map((c) => {
    return `${c}`;
  })}) VALUES (${data.map((d) => {
    return `'${d}'`;
  })})`;

  sql.query(sqlQuery, (err, res) => {
    if (err) {
      console.log("Query error: " + err);
      console.log(sqlQuery);
      result(err, null);
      return;
    }
    result(null, res);
  });
};

Table.update = (name, colName, id, data, result) => {
  sql.query(
    "UPDATE `" + name + "` SET ? WHERE `" + colName + "`=?",
    [data, id],
    (err, res) => {
      if (err) {
        console.log("Query error: " + err);
        result(err, null);
        return;
      }
      console.log(res);
      if (res.affectedRows == 0) {
        //this user id not found
        result({ kind: "not_found" }, null);
        //Mistake return so sent more than one response
        return;
      }

      console.log("Updated " + name + ": ", { data });
      result(null, { data });
    }
  );
};

Table.remove = (name, colName, id, result) => {
  console.log(name, colName, id);
  const sqlQuery = `DELETE FROM \`${name}\` WHERE \`${colName}\` = ${id}`;
  console.log(sqlQuery);
  sql.query(sqlQuery, (err, res) => {
    if (err) {
      console.log("Query error: " + err);
      result({ kind: "FOREIGN KEY CONSTRAINT" }, null);
      return;
    }
    if (res.affectedRows == 0) {
      result({ kind: "not_found" }, null);
      return;
    }
    console.log("Deleted user id: ", id);
    result(null, { id: id });
  });
};

module.exports = Table;
