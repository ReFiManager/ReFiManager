# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsItem = require "./FsItem"
FsStorage = require "../storages/FsStorage"

class RFManager extends React.Component

  constructor: (props) ->
    super props
    @state =
      items: []

  componentDidMount: () ->
    items = []
    FsStorage.getAll().then (res) =>
      for i in res
        items.push <FsItem name={i.path} />
      @setState
        items: items

  render: () ->
    <div className="RFManager-container">
      <div className="RFManager-left-bar"></div>
      <div className="RFManager-content">
        <div className="RFManager-navigation"></div>
        <div className="RFManager-breadcrumbs"></div>
        <div className="RFManager-list">
          <ul>{@state.items}</ul>
        </div>
      </div>
    </div>

module.exports = RFManager