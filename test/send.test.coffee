should = require( "should" )
assert = require( "assert" )
alexpress = require 'alexpress'
{send} = require '../index'
should.use require './ext/ext'
run = require( './ext/run' )

app = undefined

describe "send", ->

  beforeEach ->
    app = alexpress()

  it "sends output speech", ( done ) ->
    wassup = "wassup?"
    app.use send wassup

    run app, "horoscope", done, ( res ) ->
      res.should.endSession()
      res.should.have.outputSpeech wassup


