# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

gulp = require "gulp"
gulpIf = require "gulp-if"
webpack = require "gulp-webpack"
rename = require "gulp-rename"
uglify = require "gulp-uglify"
less = require "gulp-less"
minifyCSS = require "gulp-minify-css"
notify = require "gulp-notify"

webpackConfig = require "./build/webpackConfig"
paths = require "./build/paths"
distName = "ReFiManager"

getEnv = () ->
  i = 0;
  while i < process.argv.length
    if process.argv[i] == "--env"
      return process.argv[i + 1];
    i++;
  return ""

gulp.task "scripts", ->
  gulp.src "#{paths.src}/app.cjsx"
  .pipe webpack(webpackConfig)
  .pipe rename("#{distName}.js")
  .pipe(gulpIf(getEnv() == "production", uglify()))
  .pipe notify "Script is builded"
  .pipe gulp.dest "#{paths.dist.js}"

gulp.task "scripts:min", ->
  gulp.src "#{paths.dist.js}/#{distName}.js"
  .pipe uglify()
  .pipe rename("#{distName}.min.js")
  .pipe gulp.dest "#{paths.dist.js}"

gulp.task "watch", ->
  gulp.watch "#{paths.src}/**/*", ["scripts", "scripts:min"]

gulp.task "build", ["scripts", "scripts:min"]
gulp.task "default", ["build", "watch"]