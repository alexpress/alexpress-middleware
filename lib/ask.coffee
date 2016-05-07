module.exports = ( speech, prompt ) -> ( req, res, next ) ->
  res.ask speech, prompt
  
