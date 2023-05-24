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

module.exports = {
  getAllOrders,
};
