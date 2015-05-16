gulp = require 'gulp'
del = require 'del'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
browserify = require 'gulp-browserify'
livereload = require 'gulp-livereload'
extReplace = require 'gulp-ext-replace'
mochaPhantomJS = require 'gulp-mocha-phantomjs'
uglify = require 'gulp-uglify'
uglifycss = require 'gulp-uglifycss'
minifyHTML = require 'gulp-minify-html'
connect = require 'gulp-connect'

paths = 
  src: ['src/**/*']
  scripts: ['src/scripts/*.coffee']
  stylesheets: ['src/stylesheets/*.less']
  testScripts: ['test/test.coffee']
  testRunner: ['test/runner.html']
  copy: ['src/*.html', 'lib/**/*', 'assets/**/*']

logError = (e)->
  console.log e
  this.emit 'end'

# Remove previously compiled files
gulp.task 'clean', (cb)->
  del.sync('bin')

# Copy pages' html  
gulp.task 'copy', ->
  gulp.src paths.copy[0]
      .pipe gulp.dest 'bin/'
  gulp.src paths.copy[1]
      .pipe gulp.dest 'bin/lib'
  gulp.src paths.copy[2]
      .pipe gulp.dest 'bin/assets'

gulp.task 'lib', ->
  gulp.src paths.lib
      .pipe gulp.dest 'bin/lib'

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
  gulp.watch 'src/*.html', ['html']
  gulp.watch 'src/scripts/**/*', ['coffee', 'test']
  gulp.watch 'src/stylesheets/**/*', ['less']
  gulp.watch 'test/**/*', ['test']

# gulp build
gulp.task 'build', ->
  del.sync('dist')

  gulp.src(paths.scripts, {read: no})
      .pipe browserify
        debug: true,
        transform: ['coffeeify'],
        extensions: ['.coffee']
      .pipe extReplace '.js'
      .pipe uglify()
      .pipe gulp.dest 'dist/scripts/'

  gulp.src paths.stylesheets
      .pipe less()
      .pipe uglifycss()
      .pipe gulp.dest 'dist/stylesheets/'

  gulp.src paths.copy[0]
      .pipe minifyHTML()
      .pipe gulp.dest 'dist/'

  gulp.src paths.copy[1]
      .pipe gulp.dest 'dist/lib'
  gulp.src paths.copy[2]
      .pipe gulp.dest 'dist/assets'

gulp.task 'connect', ->
  connect.server()

gulp.task 'default', [
  'clean' 
  'copy'
  'coffee'
  'less'
  'connect'
  'test'
  'watch'
]