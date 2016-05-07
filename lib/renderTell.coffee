module.exports = ( speech, prompt, locals ) -> ( req, res, next ) ->
  res.renderTell speech, prompt, locals
  
