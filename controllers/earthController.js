const catchAsync = require('../utils/catchAsync');
const db = require('../utils/db');
const earthService = require('../services/earthService');

exports.getOneEarth = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const result = await earthService.findOne(id);

  if (result) {
    res.send({
      count: result.length,
      earth: result
    });
  }
});

exports.getAllEarths = catchAsync(async (req, res, next) => {
  const results = await earthService.find();

  if (results) {
    res.send({
      numEarths: results.length,
      earths: results
    });
  }
});

exports.addEarth = catchAsync(async (req, res, next) => {
  if (!req.body) {
    return res.send({ message: 'nothing to submitted' });
  }
  const result = await earthService.create(req.body);
  if (!result) {
    next();
  } else {
    res.send(result);
  }
});

exports.updateEarth = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  console.log(req.body);
  const result = await earthService.updateOne(req.body, id);

  if (!result) {
    const earths = await earthService.find();
    res.send(earths);
  }
});

exports.deleteEarth = catchAsync(async (req, res, next) => {
  const { estateId } = req.params;
  const { clientCsId } = req.params;

  const result = await earthService.deleteOne(estateId, clientCsId);

  if (!result) {
    next();
  } else {
    res.send(estateId);
  }
});

exports.getClientCs = catchAsync(async (req, res, next) => {
  const find = `SELECT * FROM client_cs`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});

exports.getAllCity = catchAsync(async (req, res, next) => {
  const find = `SELECT city.id, city.city_name
                FROM city`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});

exports.getAllNeighborhoods = catchAsync(async (req, res, next) => {
  const find = `SELECT N.id, N.neighborhood_name
                FROM neighborhood as N`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});

exports.getAllCountry = catchAsync(async (req, res, next) => {
  const find = `SELECT C.id, C.country_name
                FROM country as C`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});

exports.getAllDirections = catchAsync(async (req, res, next) => {
  const find = `SELECT C.id, C.direction_name
                FROM direction as C`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});

exports.getAllEstateTypes = catchAsync(async (req, res, next) => {
  const find = `SELECT E.id, E.estate_type_name
                FROM estate_type as E`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});

exports.getAllPropertyType = catchAsync(async (req, res, next) => {
  const find = `SELECT P.id, P.property_type_name
                FROM property_type as P`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});

exports.getAllOwnershipType = catchAsync(async (req, res, next) => {
  const find = `SELECT O.id, O.ownership_type_name
                FROM ownership_type as O`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});

exports.getAllKaza = catchAsync(async (req, res, next) => {
  const find = `SELECT K.id, K.kaza_name
                FROM kaza as K`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});

exports.getAllDistricts = catchAsync(async (req, res, next) => {
  const find = `SELECT D.id, D.district_name
                FROM district as D`;

  db.query(find, (err, result) => {
    if (err) {
      console.log(err);
      throw err;
    }
    res.send(result);
  });
});
