should = require( "should" )
assert = require( "assert" )
alexpress = require 'alexpress'
path = require 'path'
{persistSession} = require '../index'
should.use require './ext/ext'
run = require( './ext/run' )

app = undefined

describe "persist session", ->

  beforeEach ->
    app = alexpress()

  it "behavior without middleware", ( done ) ->
    run app, "horoscope", done, ( res ) ->
      Object.keys( res.sessionAttributes ).length.should.equal 0

  it "with middleware, request attributes are copied to response", ( done ) ->
    app.use persistSession

    run app, "horoscope", done, ( res ) ->
      Object.keys( res.sessionAttributes ).length.should.not.equal 0
      res.sessionAttributes.supportedHoroscopePeriods.daily.should.equal true


