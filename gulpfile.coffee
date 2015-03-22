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

gulp.task "scripts", ->
  gulp.src "#{paths.src}/app.cjsx"
  .pipe webpack(webpackConfig)
  .pipe rename("#{distName}.js")
  .pipe gulp.dest "#{paths.dist.js}"
  .pipe uglify()
  .pipe rename("#{distName}.min.js")
  .pipe gulp.dest "#{paths.dist.js}"
  .pipe notify "Script is builded"

gulp.task "watch", ->
  gulp.watch "#{paths.src}/**/*", ["scripts"]

gulp.task "build", ["scripts"]
gulp.task "default", ["build", "watch"]