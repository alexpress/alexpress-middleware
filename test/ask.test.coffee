should = require( "should" )
assert = require( "assert" )
alexpress = require 'alexpress'
{ask} = require '../index'
should.use require './ext/ext'
run = require( './ext/run' )

app = undefined

describe "ask", ->

  beforeEach ->
    app = alexpress()

  it "keeps session alive", ( done ) ->
    wassup = "wassup?"
    app.use ask wassup

    run app, "horoscope", done, ( res ) ->
      res.should.not.endSession()
      res.should.have.outputSpeech wassup


