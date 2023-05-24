module.exports = (app) => {
  const order_controller = require("../controller/order.controller");
  var router = require("express").Router();
  router.get("/", order_controller.getAllOrders);
  app.use("/order", router);
};
