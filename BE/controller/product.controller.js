const Product = require("../model/product.model");

const getAllProducts = (req, res) => {
  Product.getAll((err, data) => {
    if (err) {
      res.status(500).send({
        message: err.message || "Some error occured while retriveing data.",
      });
    } else res.send(data);
  });
};
module.exports = {
  getAllProducts,
};
