const express = require('express');
const earthController = require('../controllers/earthController');

const router = express.Router();

router.get('/getAllEarths', earthController.getAllEarths);
router.get('/getOneEarth/:id', earthController.getOneEarth);
router.post('/addEarth', earthController.addEarth);
router.put('/:id', earthController.updateEarth);
router.delete(
  '/deleteEarth/:estateId/:clientCsId',
  earthController.deleteEarth
);

router.get('/clientCs', earthController.getClientCs);

router.get('/cities', earthController.getAllCity);
router.get('/neighborhoods', earthController.getAllNeighborhoods);
router.get('/countries', earthController.getAllCountry);
router.get('/directions', earthController.getAllDirections);
router.get('/estateTypes', earthController.getAllEstateTypes);
router.get('/propertyTypes', earthController.getAllPropertyType);
router.get('/ownershipTypes', earthController.getAllOwnershipType);
router.get('/kaza', earthController.getAllKaza);
router.get('/districts', earthController.getAllDistricts);

module.exports = router;
