should = require( "should" )
assert = require( "assert" )
alexpress = require '../../alexpress/index'
{renderTell} = require '../index'
should.use require './ext/ext'
run = require( './ext/run' )
path = require 'path'

app = undefined

describe "renderTell", ->

  beforeEach ->
    app = alexpress()
    app.set 'speech', path.join __dirname, "speech"

  it "renders template and closes session", ( done ) ->
    app.use renderTell "wassup", name : 'hodor'

    run app, "horoscope", done, ( res ) ->
      res.should.endSession()
      res.should.have.outputSpeech "wassup hodor?"


