module.exports = ( speech, prompt, locals ) -> ( req, res, next ) ->
  res.render speech, prompt, locals
  
