const sql = require("../database/db");

const User = function (user) {
  this.Username = user.username;
  this.Password = user.password;
  this.First_Name = user.firstname;
  this.Last_Name = user.lastname;
  this.Email_Staff = user.email;
};

User.create = (newUser, result) => {
  sql.query("INSERT INTO staff SET ?", newUser, (err, res) => {
    if (err) {
      console.log("Query error: " + err);
      result(err, null);
      return;
    }
    console.log("Created user: ", {
      id: res.insertId,
      ...newUser,
    });

    result(null, {
      id: res.insertId,
      ...newUser,
    });
  });
};

User.login = (account, result) => {
  console.log(account);
  sql.query(
    "SELECT * FROM staff WHERE username='" + account.Username + "'",
    (err, res) => {
      if (err) {
        console.log("Query error: " + err);
        result(err, null);
        return;
      }
      if (res.length) {
        // const validPassword = bcrypt.compareSync(
        //   account.password,
        //   res[0].password
        // );
        if (account.Password === res[0].Password) {
          console.log("Login success, welcome ", account.username);
          result(null, res[0]);
          return;
        } else {
          console.log("Password invalid.");
          result({ kind: "invalid_pass" }, null);
          return;
        }
      }
      console.log(res);
      result({ kind: "not_found" }, null);
    }
  );
};

module.exports = User;
