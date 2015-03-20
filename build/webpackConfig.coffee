# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

module.exports =
  resolve:
    extensions: ['', '.coffee', '.js', '.cjsx']
  module:
    loaders: [
      {test: /\.coffee$/, loader: "coffee-loader"}
      {test: /\.cjsx$/, loader: "coffee-jsx-loader"}
      {test: /\.css$/, loader: "style-loader!css-loader"}
    ]
  node:
    dns: "empty"
    net: "empty"