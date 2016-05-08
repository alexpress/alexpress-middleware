should = require( "should" )
assert = require( "assert" )
alexpress = require 'alexpress'
{render} = require '../index'
should.use require './ext/ext'
run = require( './ext/run' )
path = require 'path'

app = undefined

describe "render", ->

  beforeEach ->
    app = alexpress()
    app.set 'speech', path.join __dirname, "speech"

  it "renders template and closes session", ( done ) ->
    app.use render "wassup", name : 'hodor'

    run app, "horoscope", done, ( res ) ->
      res.should.endSession()
      res.should.have.outputSpeech "wassup hodor?"


