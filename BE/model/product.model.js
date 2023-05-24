const sql = require("../db/db");

const Product = function (Product) {
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

Product.getCategory = (catergory, result) => {
  sql.query(
    "SELECT * FROM product WHERE Product_Category = '" + catergory + "'",
    (err, res) => {
      if (err) {
        console.log("Query error: " + err);
        result(err, null);
        return;
      }
      if (res.length) {
        console.log("Found category: ", res);
        result(null, res);
        return;
      }
      result({ kind: "not_found" }, null);
    }
  );
};

module.exports = Product;
