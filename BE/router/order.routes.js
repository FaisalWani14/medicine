module.exports = (app) => {
  const order_controller = require("../controller/order.controller");
  var router = require("express").Router();
  router.get("/", order_controller.getAllOrders);
  router.post("/", order_controller.addNewOrders);
  app.use("/order", router);
};
