# copy session attributes from the request to the response
module.exports = ( req, res, next ) ->
  res.session req.session()
  next()
