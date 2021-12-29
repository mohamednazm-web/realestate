const express = require('express');
const requestController = require('../controllers/requestController');

const router = express.Router();

router.get('/getOneRequest/:id', requestController.getOneRequest);
router.get('/getAllRequests', requestController.getAllRequests);
router.delete(
  '/deleteRequest/:requestId/:requestCsId',
  requestController.deleteRequest
);
router.get('/requestCs', requestController.getRequestCs);
router.post('/addRequest', requestController.addRequest);
router.put('/:id', requestController.updateRequest);

module.exports = router;
