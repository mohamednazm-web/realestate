const crypto = require('crypto');
const moment = require('moment');
const DB = require('../utils/db');

module.exports.count = async function(page, PAGE_SIZE) {
  const sql = `SELECT count(*) as Total FROM request`;
  try {
    const total = await DB.query(sql);
    return total[0].Total;
  } catch (err) {
    console.log(err);
    throw err;
  }
};

module.exports.create = async function(request) {
  const request_id = crypto.randomBytes(8).toString('hex');
  const request_cs_id = crypto.randomBytes(8).toString('hex');

  const {
    estate_type_id,
    neighborhood_id,
    property_type_id,
    description,
    request_cs_name,
    request_cs_phone
  } = request;

  let addRequestCs = `INSERT INTO request_cs (request_cs_id, request_cs_name, request_cs_phone, date_signed)
                              VALUES ("${request_cs_id}",
                                      "${request_cs_name}",
                                      "${request_cs_phone}",
                                      "${moment().format()}")`;

  let addRequest = `INSERT INTO request (id, request_cs_id, estate_type_id, neighborhood_id, property_type_id,date_signed, description)
                              VALUES ( "${request_id}",
                                        "${request_cs_id}",
                                        "${estate_type_id}",
                                        "${neighborhood_id}",
                                        "${property_type_id}",
                                        "${moment().format()}",
                                        "${description}")`;

  const lastRequest = `SELECT *, request.id
              FROM request
              INNER JOIN request_cs ON request.request_cs_id = request_cs.request_cs_id
              INNER JOIN estate_type ON request.estate_type_id = estate_type.id
              INNER JOIN neighborhood ON request.neighborhood_id = neighborhood.id
              INNER JOIN property_type ON request.property_type_id = property_type.id ORDER BY request.id DESC LIMIT 1000;`;

  try {
    const res = await DB.query(addRequestCs);
    if (res.affectedRows == 1) {
      const res1 = await DB.query(addRequest);
      if (res1.affectedRows == 1) {
        return await DB.query(lastRequest);
      }
    }
  } catch (error) {
    throw error;
  }
};

module.exports.find = async function() {
  const sql = `
      SELECT *, request.id
        FROM request
        INNER JOIN request_cs ON request.request_cs_id = request_cs.request_cs_id
        INNER JOIN estate_type ON request.estate_type_id = estate_type.id
        INNER JOIN neighborhood ON request.neighborhood_id = neighborhood.id
        INNER JOIN property_type ON request.property_type_id = property_type.id ORDER BY request.id DESC LIMIT 1000;
    `;
  try {
    const requests = await DB.query(sql);
    return requests;
  } catch (err) {
    console.log(err);
    throw err;
  }
};

module.exports.getRequestCs = async function() {
  let sql = `SELECT * FROM request_cs`;

  try {
    const requests = await DB.query(sql);
    return requests;
  } catch (err) {
    console.log(err);
    throw err;
  }
};

module.exports.findOne = async function(id) {
  let sql = `
      SELECT
        request_cs.request_cs_id,
        request.id,
        request_cs.request_cs_name,
        request_cs.request_cs_phone,
        request.description,
        request.date_signed,
        estate_type.estate_type_name,
        neighborhood.neighborhood_name,
        property_type.property_type_name
        FROM request
        INNER JOIN request_cs ON request.request_cs_id = request_cs.request_cs_id
        INNER JOIN estate_type ON request.estate_type_id = estate_type.id
        INNER JOIN neighborhood ON request.neighborhood_id = neighborhood.id
        INNER JOIN property_type ON request.property_type_id = property_type.id
        WHERE request.id = ?;
    `;
  try {
    return await DB.query(sql, [id]);
  } catch (err) {
    console.log(err);
    throw err;
  }
};

module.exports.updateOne = async function(request, id) {
  const {
    estate_type_id,
    neighborhood_id,
    property_type_id,
    description,
    request_cs_name,
    request_cs_phone
  } = request;
  let sql = `
      UPDATE Request, Request_cs
      SET
      Request.estate_type_id =?, Request.neighborhood_id =?, Request.property_type_id =?, Request.description =?, Request.modified_at =?,
      Request_cs.request_cs_name =?, Request_cs.request_cs_phone =?, Request_cs.modified_at =?
      WHERE Request.request_cs_id = Request_cs.request_cs_id AND Request.id =?;
    `;
  try {
    let result = await DB.query(sql, [
      estate_type_id,
      neighborhood_id,
      property_type_id,
      description,
      moment().format(),
      request_cs_name,
      request_cs_phone,
      moment().format(),
      id
    ]);

    // If updated successfully, return true
    return result.affectedRows === 1;
  } catch (err) {
    console.log(err);
    throw err;
  }
};

module.exports.deleteOne = async function(requestId, requestCsId) {
  const sql = `
            DELETE a.*, b.*
            FROM request as a, request_cs as b
            WHERE a.id="${requestId}" and b.request_cs_id="${requestCsId}"
            `;
  try {
    const res = await DB.query(sql);
    if (res.affectedRows === 2) {
      console.log(res);
      return true;
    }
  } catch (error) {
    throw error;
  }
};
