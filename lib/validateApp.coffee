TypedError = require "error/typed" 

AppIdError = TypedError
  type : 'appId'
  message : "Application id in request does not match our application id"
  appId : null
  request : null

module.exports = ( appId ) -> ( req, res, next ) ->
  return next() if appId is req.applicationId
  throw new AppIdError appId : appId, request : req.applicationId
