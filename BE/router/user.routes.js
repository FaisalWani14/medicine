module.exports = (app) => {
  const user_controller = require("../controller/user.controller");
  var router = require("express").Router();
  router.post("/signup", user_controller.creatNewUser);
  router.post("/login", user_controller.login);
  app.use("/auth", router);
};
