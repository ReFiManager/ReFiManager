# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
SelectionStorage = require "../storages/SelectionStorage"
Utils = require "../utils/Utils"

class SelectedItem extends React.Component

  constructor: (props) ->
    super props

  render: () ->
    <li className="list-group-item" title={@props.fsObject.name}>
      {Utils.truncate @props.fsObject.name, 20}
      <a href="#" onClick={@_removeItem.bind @} className="btn btn-xs btn-danger pull-right">&times;</a>
    </li>

  _removeItem: (e) ->
    SelectionStorage.remove @props.fsObject
    e.stopPropagation()


module.exports = SelectedItem