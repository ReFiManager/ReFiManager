# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

gulp = require "gulp"
webpack = require "gulp-webpack"
rename = require "gulp-rename"
uglify = require "gulp-uglify"
webpackConfig = require "./build/webpackConfig"
paths = require "./build/paths"

gulp.task "scripts", ->
  gulp.src "#{paths.app}/app.coffee"
  .pipe webpack(webpackConfig)
  .pipe rename("app.js")
  .pipe uglify()
  .pipe gulp.dest "#{paths.dist.js}"

gulp.task "default", ["scripts"]