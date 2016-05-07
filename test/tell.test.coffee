should = require( "should" )
assert = require( "assert" )
alexpress = require 'alexpress'
{tell} = require '../index'
should.use require './ext/ext'
run = require( './ext/run' )

app = undefined

describe "tell", ->

  beforeEach ->
    app = alexpress()

  it "closes the session", ( done ) ->
    wassup = "wassup?"
    app.use tell wassup

    run app, "horoscope", done, ( res ) ->
      res.should.endSession()
      res.should.have.outputSpeech wassup


