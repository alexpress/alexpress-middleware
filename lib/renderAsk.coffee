module.exports = ( speech, prompt, locals ) -> ( req, res, next ) ->
  res.renderAsk speech, prompt, locals
  
