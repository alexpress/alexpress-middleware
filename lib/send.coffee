module.exports = ( speech, prompt ) -> ( req, res, next ) ->
  res.send speech, prompt
  
