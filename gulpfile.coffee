# This file is part of the RFManager package.
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

webpackConfig = require "./build/webpackConfig"
paths = require "./build/paths"

getEnv = () ->
  i = 0;
  while i < process.argv.length
    if process.argv[i] == "--env"
      return process.argv[i + 1];
    i++;
  return ""

gulp.task "scripts", ->
  gulp.src "#{paths.app}/app.cjsx"
  .pipe webpack(webpackConfig)
  .pipe rename("app.js")
  .pipe(gulpIf(getEnv() == "production", uglify()))
  .pipe gulp.dest "#{paths.dist.js}"


gulp.task "default", ["scripts"]