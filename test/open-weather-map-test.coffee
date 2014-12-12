chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'open-weather-map', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/open-weather-map')(@robot)

  it 'registers a respond listener for help', ->
    expect(@robot.respond).to.have.been.calledWith(/weather help$/i)

  it 'registers a respond listener for default cities', ->
    expect(@robot.respond).to.have.been.calledWith(/weather$/i)

  it 'registers a respond listener for a city', ->
    expect(@robot.respond).to.have.been.calledWith(/weather (.*)/i)
