module.exports = (app) => {
  const product_controller = require("../controller/product.controller");
  var router = require("express").Router();
  router.get("/all", product_controller.getAllProducts);
  router.get("/:category", product_controller.getCategoryProducts);
  app.use("/api", router);
};
