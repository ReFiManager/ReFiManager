# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
Navigation = require "./Navigation"

class RFManager extends React.Component

  render: () ->
    <div className="RFManager-container">
      <div className="RFManager-leftBar"></div>
      <div className="RFManager-content">
        <Navigation />
        <div className="RFManager-list"></div>
      </div>
    </div>

module.exports = RFManager