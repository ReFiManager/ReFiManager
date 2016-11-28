/**
 * This file is part of the ReFiManager package.
 * (c) Ondřej Záruba <zarubaondra@gmail.com>
 *
 * For the full copyright and license information, please view
 * the license.md file that was distributed with this source code.
**/

const path = require('path')
const gulp = require('gulp')
const notify = require('gulp-notify')
const rename = require('gulp-rename')
const less = require('gulp-less')
const babel = require('gulp-babel')
const webpack = require('webpack-stream')
const runSequence = require('run-sequence')

const packageFile = require('./package')

const paths = {
  lib: path.join(__dirname, 'lib'),
  dist: path.join(__dirname, 'dist'),
  src: {
    scripts: path.join(__dirname, 'src/scripts/**/*'),
    styles: path.join(__dirname, 'src/styles')
  }
}

gulp.task('styles:dist', () => {
  return gulp.src(path.join(paths.src.styles, 'bootstrap.less'))
  .pipe(less())
  .pipe(rename(`${packageFile.name}.css`))
  .pipe(gulp.dest(paths.dist))
})

gulp.task('scripts:build', () => {
  return gulp.src(paths.src.scripts)
  .pipe(babel({
    presets: ['es2015', 'react', 'stage-0'],
    plugins: ['babel-plugin-add-module-exports']
  }))
  .pipe(gulp.dest(paths.lib))
})

gulp.task('scripts:dist', () => {
  return gulp.src(path.join(paths.lib, 'index.js'))
  .pipe(webpack({
    output: {
      libraryTarget: 'var',
      library: 'ReFiManager',
    },
    externals: {
      react: 'React',
      'react-dom': 'ReactDOM',
    }
  }))
  .pipe(rename(`${packageFile.name}.js`))
  .pipe(gulp.dest(paths.dist))
})

gulp.task('notify', () => {
  return gulp.src('')
  .pipe(notify('Build completed'))
})

gulp.task('watch', () => {
  return gulp.watch(paths.src.scripts, () => {
    runSequence('scripts:build', 'scripts:dist', 'notify')
  })
  return gulp.watch(`${paths.src.styles}/**/*`, () => {
    runSequence('styles:dist', 'notify')
  })
})

gulp.task('build', () => {
  return runSequence(['styles:dist', 'scripts:build'], 'notify')
})

gulp.task('dist', () => {
  return runSequence(['styles:dist', 'scripts:build'], 'scripts:dist', 'notify')
})

gulp.task('default', () => {
  return runSequence(['styles:dist', 'scripts:build'], 'scripts:dist', 'notify', 'watch')
})