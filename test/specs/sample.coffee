changeH1Color = (require "../../src/coffee/another-module.coffee").changeH1Color

sinon = require "sinon"

describe "Sample Spec", ->

    it "h1 color should be changed", ->
        changeH1Color()
        h1 = $ "h1"
        h1.css("color").should.equal "rgb(255, 0, 0)"

    it "a should be a", ->
        'a'.should.be.equal 'a'

    it "The function should be called", (done)->
        callback = sinon.spy()
        setTimeout ->
            callback()
            callback.should.have.been.called
            done()
        , 10
