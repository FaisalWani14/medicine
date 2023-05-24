const Table = require("../model/table.model");

const getTable = (req, res) => {
  Table.getTableName(req.params.name, (err, data) => {
    if (err) {
      res.status(500).send({
        message: err || "Some error occured while retriveing data.",
      });
    } else res.send(data);
  });
};
const addRow = (req, res) => {
  Table.insert(
    req.params.name,
    Object.keys(req.body),
    Object.values(req.body),
    (err, data) => {
      if (err) {
        res.status(500).send({
          message: err || "Some error occured while retriveing data.",
        });
      } else res.send(data);
    }
  );
};

const updateRow = (req, res) => {
  if (!req.body) {
    res.status(400).send({ message: "Content can not be empty." });
  }
  const data = (({ colName, ...o }) => o)(req.body);

  Table.update(
    req.params.name,
    req.body.colName,
    parseInt(req.params.id),
    data,
    (err, result) => {
      if (err) {
        if (err.kind == "not_found") {
          res.status(401).send({
            message: "Not found " + req.params.name + " id: " + req.params.id,
          });
        } else {
          res.status(500).send({
            message:
              "Error update " + req.params.name + " id: " + req.params.id,
          });
        }
      } else res.send(result);
    }
  );
};

const deleteRow = (req, res) => {
  Table.remove(
    req.params.name,
    req.params.colName,
    parseInt(req.params.id),
    (err, result) => {
      if (err) {
        if (err.kind == "not_found") {
          res.status(401).send({
            message: "Not found " + req.body.name + " id: " + req.params.id,
          });
        } else {
          res.status(500).send({
            message: "Error delete " + req.body.name + " id: " + req.params.id,
          });
        }
      } else res.send(result);
    }
  );
};

module.exports = {
  getTable,
  addRow,
  updateRow,
  deleteRow,
};
