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

const getCategoryProducts = (req, res) => {
  Product.getCategory(req.params.category, (err, data) => {
    if (err) {
      if (err.kind == "not_found") {
        res.send({
          message: "Not found " + req.params.category,
          valid: true,
        });
      } else {
        res.status(500).send({
          message: "Error retriveing " + req.params.us,
        });
      }
    } else res.send({ record: data, valid: false });
  });
};

module.exports = {
  getAllProducts,
  getCategoryProducts,
};
