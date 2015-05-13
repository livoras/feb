chai = require "chai"
sinonChai = require "sinon-chai"

chai.should()
chai.use(sinonChai)

require "./specs/sample.coffee"
