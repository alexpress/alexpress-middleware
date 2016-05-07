should = require( "should" )
assert = require( "assert" )
alexpress = require '../../alexpress/index'
{renderAsk} = require '../index'
should.use require './ext/ext'
run = require( './ext/run' )
path = require 'path'

app = undefined

describe "renderAsk", ->

  beforeEach ->
    app = alexpress()
    app.set 'speech', path.join __dirname, "speech"

  it "renders template and keeps session alive", ( done ) ->
    app.use renderAsk "wassup", name : 'hodor'

    run app, "horoscope", done, ( res ) ->
      res.should.not.endSession()
      res.should.have.outputSpeech "wassup hodor?"


