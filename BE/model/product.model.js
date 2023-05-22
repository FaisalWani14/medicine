const sql = require("../database/db");

const Product = function (user) {
  this.Product_Id = Product.Product_Id;
  this.Supplier_Id = Product.Supplier_Id;
  this.Product_Name = Product.Product_Name;
  this.Product_Description = Product.Product_Description;
  this.Product_Unit = Product.Product_Unit;
  this.Product_Price = Product.Product_Price;
  this.Product_Status = Product.Product_Status;
};
Product.getAll = (result) => {
  sql.query("SELECT * FROM product ", (err, res) => {
    if (err) {
      console.log("Query error: " + err);
      result(err, null);
      return;
    }
    result(null, res);
  });
};

module.exports = Product;
