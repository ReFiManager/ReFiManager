/**
 * This file is part of the ReFiManager package.
 * (c) Ondřej Záruba <zarubaondra@gmail.com>
 *
 * For the full copyright and license information, please view
 * the license.md file that was distributed with this source code.
**/

const path = require('path')

module.exports = {
  entry: path.join(__dirname, 'src/scripts/index.js'),
  output: {
    path: path.join(__dirname, './dist'),
    filename: 'refimanager.js'
  },
  externals: {
    react: 'React',
    'react-dom': 'ReactDOM',
  },
  resolve: {
    root: [
      path.resolve(__dirname + '/src')
    ],
    extensions: ['', '.js']
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'stage-0', 'react']
        }
      }
    ]
  }
}