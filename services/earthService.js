const moment = require('moment');
const crypto = require('crypto');
const DB = require('../utils/db');

module.exports.find = async function() {
  const find = `
    SELECT *, estate.id
    FROM estate
    INNER JOIN client_cs ON estate.client_cs_id = client_cs.client_cs_id
    INNER JOIN kaza ON estate.kaza_id = kaza.id
    INNER JOIN city ON estate.city_id = city.id
    INNER JOIN estate_type ON estate.estate_type_id = estate_type.id
    INNER JOIN district ON estate.district_id = district.id
    INNER JOIN direction ON estate.direction_id = direction.id
    INNER JOIN ownership_type ON estate.ownership_type_id = ownership_type.id
    INNER JOIN owner_of_property ON estate.owner_of_property_id = owner_of_property.id
    INNER JOIN property_type ON estate.property_type_id = property_type.id ORDER BY estate.id DESC LIMIT 1000;
  `;

  try {
    const earths = await DB.query(find);
    return earths;
  } catch (error) {
    throw error;
  }
};

module.exports.findOne = async function(id) {
  const sql = `
          SELECT *, estate.id
          FROM estate
          INNER JOIN client_cs ON estate.client_cs_id = client_cs.client_cs_id
          INNER JOIN kaza ON estate.kaza_id = kaza.id
          INNER JOIN city ON estate.city_id = city.id
          INNER JOIN estate_type ON estate.estate_type_id = estate_type.id
          INNER JOIN district ON estate.district_id = district.id
          INNER JOIN direction ON estate.direction_id = direction.id
          INNER JOIN ownership_type ON estate.ownership_type_id = ownership_type.id
          INNER JOIN owner_of_property ON estate.owner_of_property_id = owner_of_property.id
          INNER JOIN property_type ON estate.property_type_id = property_type.id
          WHERE estate.id =?;`;

  try {
    const result = await DB.query(sql, [id]);
    return result;
  } catch (error) {
    throw error;
  }
};

module.exports.create = async function(earth) {
  const estate_id = crypto.randomBytes(4).toString('hex');
  const client_cs_id = crypto.randomBytes(4).toString('hex');
  const ownerOfPropertyId = crypto.randomBytes(4).toString('hex');

  const {
    estate_type_id,
    neighborhood_id,
    property_type_id,
    ownership_type_id,
    direction_id,
    area,
    balconies_space,
    number_of_estate,
    price,
    moon_introduction,
    date_signed,
    number_of_earth,
    owner_of_property_id,
    number_of_floor,
    number_of_room,
    number_of_bedrooms,
    number_of_bathrooms,
    number_of_ws,
    city_id,
    kaza_id,
    district_id,
    estate_description
  } = earth;

  const { client_cs_name, client_cs_phone } = earth;

  const { owner_of_property_name } = earth;

  let createClientCs = `INSERT INTO client_cs (client_cs_id, client_cs_name, client_cs_phone)
                            VALUES ("${client_cs_id}",
                                     "${client_cs_name}",
                                     "${client_cs_phone}")`;

  let createOwnerOfProperty = `INSERT INTO owner_of_property (id, owner_of_property_name)
                                     VALUES ("${ownerOfPropertyId}","${owner_of_property_name}")`;

  let createEstate = `INSERT INTO estate (id, client_cs_id, estate_type_id, neighborhood_id, property_type_id, ownership_type_id, direction_id, area, balconies_space, number_of_estate, price, moon_introduction, date_signed, number_of_earth, owner_of_property_id, number_of_floor, number_of_room, number_of_bedrooms, number_of_bathrooms, number_of_ws, city_id, kaza_id, district_id, estate_description)
                                     VALUES ( "${estate_id}",
                                              "${client_cs_id}",
                                              "${estate_type_id}",
                                              "${neighborhood_id}",
                                              "${property_type_id}",
                                              "${ownership_type_id}",
                                              "${direction_id}",
                                              "${area}",
                                              "${balconies_space}",
                                              "${number_of_estate}",
                                              "${price}",
                                              "${moon_introduction}",
                                              "${date_signed}",
                                              "${number_of_earth}",
                                              "${ownerOfPropertyId}",
                                              "${number_of_floor}",
                                              "${number_of_room}",
                                              "${number_of_bedrooms}",
                                              "${number_of_bathrooms}",
                                              "${number_of_ws}",
                                              "${kaza_id}",
                                              "${city_id}",
                                              "${district_id}",
                                              "${estate_description}")`;
  try {
    const res = await DB.query(createClientCs);
    if (res.affectedRows == 1) {
      const res1 = await DB.query(createOwnerOfProperty);
      if (res1.affectedRows == 1) {
        const res2 = await DB.query(createEstate);
        return res2.affectedRows == 1;
      }
    }
  } catch (error) {
    throw error;
  }
};

module.exports.updateOne = async function(earth, id) {
  const {
    city_id,
    estate_type_id,
    price,
    moon_introduction,
    area,
    number_of_estate,
    number_of_earth,
    number_of_floor,
    number_of_balconies,
    balconies_space,
    number_of_bedrooms,
    number_of_bathrooms,
    number_of_room,
    number_of_ws,
    estate_description,
    property_type_id,
    kaza_id,
    district_id,
    direction_id,
    neighborhood_id,
    ownership_type_id,
    client_cs_name,
    client_cs_phone,
    owner_of_property_name
  } = earth;
  let sql = `
        UPDATE Estate,Client_cs, Owner_of_property
        SET
        Estate.city_id=?, Estate.estate_type_id=?, Estate.price=?, Estate.moon_introduction=?, 
        Estate.area=?, Estate.modified_at=?, Estate.number_of_estate=?, 
        Estate.number_of_earth=?, Estate.number_of_floor=?,
        Estate.number_of_balconies=?, Estate.balconies_space=?, 
        Estate.number_of_bedrooms=?, Estate.number_of_bathrooms=?, 
        Estate.number_of_room=?, Estate.number_of_ws=?, 
        Estate.estate_description=?, Estate.property_type_id=?, Estate.kaza_id=?, 
        Estate.district_id=?, Estate.direction_id=?, Estate.neighborhood_id=?, Estate.ownership_type_id=?, 
        Client_cs.client_cs_name=?, Client_cs.client_cs_phone=?, Client_cs.modified_at=?,
        Owner_of_property.owner_of_property_name=?, Owner_of_property.modified_at=? 
        WHERE 
        Estate.client_cs_id=Client_cs.client_cs_id 
        AND 
        Estate.owner_of_property_id=Owner_of_property.id 
        AND Estate.id=?;`;
  try {
    const result = await DB.query(sql, [
      city_id,
      estate_type_id,
      price,
      moon_introduction,
      area,
      moment().format(),
      number_of_estate,
      number_of_earth,
      number_of_floor,
      number_of_balconies,
      balconies_space,
      number_of_bedrooms,
      number_of_bathrooms,
      number_of_room,
      number_of_ws,
      estate_description,
      property_type_id,
      kaza_id,
      district_id,
      direction_id,
      neighborhood_id,
      ownership_type_id,
      client_cs_name,
      client_cs_phone,
      moment().format(),
      owner_of_property_name,
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

module.exports.deleteOne = async function(estateId, clientCsId) {
  const sql = `
            DELETE a.*, b.*
            FROM estate as a, client_cs as b
            WHERE a.id="${estateId}" and b.client_cs_id="${clientCsId}"
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
