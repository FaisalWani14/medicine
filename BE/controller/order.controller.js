const Order = require("../model/order.model");

const getAllOrders = (req, res) => {
  Order.getOrder((err, data) => {
    if (err) {
      res.status(500).send({
        message: err.message || "Some error occured while retriveing data.",
      });
    } else res.send(data);
  });
};

const addNewOrders = (req, res) => {
  const newOrderCol = Object.keys(req.body.newOrders);
  const newOrderRow = Object.values(req.body.newOrders);
  const newOrderDetailsCol = Object.keys(req.body.newOrderDetails);
  const newOrderDetailsRow = Object.values(req.body.newOrderDetails);
  const newPaymentRow = Object.values(req.body.newPayment);
  Order.create(
    newOrderCol,
    newOrderRow,
    newOrderDetailsCol,
    newOrderDetailsRow,
    newPaymentRow,
    (err, data) => {
      if (err) {
        res.status(500).send({
          message: err || "Some error occured while retriveing data.",
        });
      } else res.send(data);
    }
  );
};

module.exports = {
  getAllOrders,
  addNewOrders,
};
