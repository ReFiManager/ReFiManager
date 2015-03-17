# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
SelectionStorage = require "../storages/SelectionStorage"

class SelectedItem extends React.Component

  constructor: (props) ->
    super props

  render: () ->
    <li className="list-group-item">
      {@props.fsObject.name}
      <a href="#" onClick={@_removeItem.bind @} className="btn btn-xs btn-danger pull-right">&times;</a>
    </li>

  _removeItem: (e) ->
    SelectionStorage.remove @props.fsObject
    e.stopPropagation()


module.exports = SelectedItem