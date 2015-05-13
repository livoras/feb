gulp = require 'gulp'
del = require 'del'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
browserify = require 'gulp-browserify'
livereload = require 'gulp-livereload'
extReplace = require 'gulp-ext-replace'
mochaPhantomJS = require 'gulp-mocha-phantomjs'

paths = 
  src: ['src/**/*']
  scripts: ['src/scripts/*.coffee']
  stylesheets: ['src/stylesheets/*.less']
  testScripts: ['test/test.coffee']
  testRunner: ['test/runner.html']

logError = (e)->
  console.log e
  this.emit 'end'

# Remove previously compiled files
gulp.task 'clean', (cb)->
  del.sync('bin')

# Compile coffeeScript to JavaScript and leverage Browserify
gulp.task 'coffee', -> 
  gulp.src(paths.scripts, {read: no})
      .pipe browserify
        debug: true,
        transform: ['coffeeify'],
        extensions: ['.coffee']
      .on 'error', logError
      .pipe extReplace '.js'
      .pipe gulp.dest 'bin/scripts/'
      .pipe livereload()

# Compile LESS to CSS
gulp.task 'less', ->
  gulp.src paths.stylesheets
      .pipe less()
      .on 'error', logError
      .pipe gulp.dest 'bin/stylesheets/'
      .pipe livereload()

# Mocha test
gulp.task 'test-coffee', ->
  gulp.src(paths.testScripts, {read: no})
      .pipe browserify
        debug: true,
        transform: ['coffeeify'],
        extensions: ['.coffee']
      .on 'error', logError
      .pipe extReplace '.js'
      .pipe gulp.dest 'bin/test/'

gulp.task 'test', ['test-coffee'], ->
  gulp.src paths.testRunner
      .pipe mochaPhantomJS({reporter: 'spec'})
      .on 'error', logError

# Wathc files to make automatically compile
gulp.task 'watch', ->      
  livereload.listen()
  gulp.watch 'src/scripts/**/*', ['coffee', 'test']
  gulp.watch 'src/stylesheets/**/*', ['less']
  gulp.watch 'test/**/*', ['test']

gulp.task 'default', ['clean', 'coffee', 'less', 'test', 'watch']