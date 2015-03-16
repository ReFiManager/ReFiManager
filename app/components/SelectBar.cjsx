# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"

class SelectBar extends React.Component

  render: () ->
    <div className="RFManager-selectBar">
      <img src="" />
      <input type="text" />
      <a href="#" className="RFManager-insertButton">Insert</a>
    </div>

module.exports = SelectBar