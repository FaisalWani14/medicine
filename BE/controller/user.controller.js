const User = require("../model/user.model");

const creatNewUser = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty.",
    });
  }

  const userObj = new User({
    username: req.body.username,
    password: req.body.password,
    firstname: req.body.name.split(" ")[0],
    lastname: req.body.name.split(" ")[1],
    email: req.body.email,
    phone: req.body.phone,
    address: req.body.address,
  });

  User.create(userObj, (err, data) => {
    if (err) {
      res.status(500).send({
        message: err.message || "Some error occured while creating.",
      });
    } else res.send(data);
  });
};

const login = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty.",
    });
  }

  const account = new User({
    username: req.body.username,
    password: req.body.password,
  });

  User.login(account, (err, data) => {
    if (err) {
      if (err.kind == "not_found") {
        res.status(401).send({
          message: "Not found " + req.body.username,
        });
      } else if (err.kind == "invalid_pass") {
        res.status(401).send({
          message: "Invalid Password",
        });
      } else {
        res.status(500).send({
          message: "Error retriveing " + req.body.username,
        });
      }
    } else res.send(data);
  });
};

module.exports = {
  creatNewUser,
  login,
};
