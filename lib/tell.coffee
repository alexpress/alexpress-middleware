module.exports = ( speech, prompt ) -> ( req, res, next ) ->
  res.tell speech, prompt 
  
