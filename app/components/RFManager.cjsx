# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
Navigation = require "./Navigation"
FsItemList = require "./FsItemList"
SelectBar = require "./SelectBar"

class RFManager extends React.Component

  render: () ->
    <div className="RFManager-container">
      <SelectBar />
      <div className="RFManager-content">
        <Navigation />
        <FsItemList />
      </div>
    </div>

module.exports = RFManager