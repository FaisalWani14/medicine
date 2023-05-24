module.exports = (app) => {
  const table_controller = require("../controller/table.controller");
  var router = require("express").Router();
  router.get("/:name", table_controller.getTable);
  router.post("/:name", table_controller.addRow);
  router.put("/:name/:id", table_controller.updateRow);
  router.delete("/:name/:colName/:id", table_controller.deleteRow);
  app.use("/table", router);
};
