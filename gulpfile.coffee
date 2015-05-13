gulp = require 'gulp'
del = require 'del'
coffee = require 'gulp-coffee'
browserify = require 'gulp-browserify'

paths = 
  src: ['src/**/*']
  scripts: ['src/scripts/*.coffee']
  stylesheets: ['src/stylesheets/*.less']

logError = (e)->
  console.log e
  this.emit 'end'

gulp.task 'clean', (cb)->
  del.sync('bin')

gulp.task 'coffee', -> 
  gulp.src(paths.scripts, {read: no})
      .pipe browserify
        debug: true,
        transform: ['coffeeify'],
        extensions: ['.coffee']
      .on 'error', logError
      .pipe gulp.dest 'bin/scripts/'

gulp.task 'watch', ->      
  gulp.watch paths.src, ['coffee']

gulp.task 'default', ['clean', 'coffee', 'watch']