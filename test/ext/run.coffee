path = require 'path'
session = {}
context = {}
merge = ( target, src ) -> target[ k ] = v for own k,v of src

request = ( name ) -> require path.join __dirname, "../fixtures", "request", "#{name}.json"

run = ( app, name, done, fn ) -> 
  r = request name
  session = {} if r.session.new
  merge r.session.attributes, session

  app.run r, ( err, res ) ->
    merge session, res.sessionAttributes
    return done err if err?
    fn res if fn?
    done()

module.exports = run