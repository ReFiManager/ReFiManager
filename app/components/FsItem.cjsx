# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
NavigationStorage = require "../storages/NavigationStorage"
SelectionStorage = require "../storages/SelectionStorage"

class FsItem extends React.Component

  fsObject: {}

  constructor: (props) ->
    super props
    @fsObject = props.fsObject
    @state =
      selected: @isSelected()

  componentDidMount: () ->
    SelectionStorage.addUpdateListener(@_onChange.bind @);

  componentWillUnmount: () ->
    SelectionStorage.removeUpdateListener(@_onChange.bind @)

  isSelected: () ->
    return SelectionStorage.exist @fsObject

  render: () ->
    if @fsObject.type == "directory"
      val = <a href="#" onClick={@_moveInto.bind @}>{@fsObject.name}</a>
    else
      val = @fsObject.name
    return (
      <tr className="RFManager-fsItem">
        <td><input type="checkbox" checked={@state.selected} onChange={@_onToggleSelect.bind @}/></td>
        <td>{val}</td>
      </tr>
    )

  _onChange: () ->
    @setState
      selected: @isSelected()

  _onToggleSelect: () ->
    SelectionStorage.toggle @fsObject

  _moveInto: (e) ->
    if @fsObject.type == "directory"
      NavigationStorage.add @fsObject
      e.stopPropagation()

module.exports = FsItem