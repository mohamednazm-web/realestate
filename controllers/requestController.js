const catchAsync = require('../utils/catchAsync');
const requestService = require('../services/requestService');

// GET ONE REQUESTS
exports.getOneRequest = catchAsync(async (req, res, next) => {
  const { id } = req.params;

  const request = await requestService.findOne(id);

  if (request) {
    res.send(request);
  }
});

// GET ALL REQUESTS
exports.getAllRequests = catchAsync(async (req, res, next) => {
  const requests = await requestService.find();
  if (requests) {
    res.json({ requests });
  }
});

exports.addRequest = catchAsync(async (req, res, next) => {
  const result = await requestService.create(req.body);
  if (result) {
    res.send(result);
  }
});

// GET ALL CLIENT REQUEST
exports.getRequestCs = catchAsync(async (req, res, next) => {
  const result = await requestService.getRequestCs();
  if (result) {
    res.send(result);
  }
});

// DELETE ONE EARTH
exports.deleteRequest = catchAsync(async (req, res, next) => {
  const { requestId } = req.params;
  const { requestCsId } = req.params;

  const result = await requestService.deleteOne(requestId, requestCsId);

  if (!result) {
    next();
  } else {
    res.send(requestId);
  }
});

// UPDATE ONE REQUEST
exports.updateRequest = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const result = await requestService.updateOne(req.body, id);

  if (!result) {
    const requests = await requestService.find();
    res.send(requests);
  }
});
