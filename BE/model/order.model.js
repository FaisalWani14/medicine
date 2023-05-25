const sql = require("../db/db");

const Order = function (order) {
  this.Bill_Number = order.Bill_Number;
  this.Product_Name = order.Product_Name;
  this.Product_Description = order.Product_Description;
  this.Quantity = order.Quantity;
  this.Unit_Price = order.Unit_Price;
  this.Discount = order.Discount;
  this.Total = order.Total;
};

Order.getOrder = (result) => {
  sql.query(
    "SELECT order_details.Bill_Number,product.Product_Name,product.Product_Description, order_details.Quantity, order_details.Unit_Price,order_details.Discount,order_details.Total\
    FROM order_details\
    INNER JOIN product\
    ON order_details.Product_Id = product.Product_Id\
    LIMIT 1",
    (err, res) => {
      if (err) {
        console.log("Query error: " + err);
        result(err, null);
        return;
      }
      result(null, res);
    }
  );
};

Order.create = (
  newOrdersCol,
  newOrdersRow,
  newOrderDetailsCol,
  newOrderDetailsRow,
  newPaymentRow,
  result
) => {
  const ordersQuery = `INSERT INTO \`orders\` (${newOrdersCol.map((c) => {
    return `${c}`;
  })}) VALUES (${newOrdersRow.map((d) => {
    return `'${d}'`;
  })});`;
  const orderDetailsQuery = `INSERT INTO \`order_details\` (${newOrderDetailsCol.map(
    (c) => {
      return `${c}`;
    }
  )}) VALUES (${newOrderDetailsRow.map((d) => {
    return `'${d}'`;
  })});`;
  const paymentQuery = `INSERT INTO \`payment\` (\`Payment_type\`) VALUES ('${newPaymentRow}');`;

  const sqlQuery = `${ordersQuery} ${paymentQuery} ${orderDetailsQuery}`;
  console.log(sqlQuery);

  sql.query(sqlQuery, (err, res) => {
    if (err) {
      console.log("Query error: " + err);
      result(err, null);
      return;
    }
    console.log("Created order: ", {
      res,
    });

    result(null, {
      message: "INSERTED",
    });
  });
};

module.exports = Order;
