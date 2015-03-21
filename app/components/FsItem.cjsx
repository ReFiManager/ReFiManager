# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
NavigationStorage = require "../storages/NavigationStorage"
SelectionStorage = require "../storages/SelectionStorage"
FsResource = require "../resources/FsResource"
Utils = require "../utils/Utils"

class FsItem extends React.Component

  fsObject: {}
  maxLength: 40

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
      val = <a href="#" onClick={@_moveInto.bind @} title={@fsObject.name}>{Utils.truncate @fsObject.name, @maxLength}</a>
    else
      val = <span title={@fsObject.name}>{Utils.truncate @fsObject.name, @maxLength}</span>
    return (
      <tr className="ReFiManager-fsItem">
        <td><input type="checkbox" checked={@state.selected} onChange={@_onToggleSelect.bind @}/></td>
        <td>{val}</td>
        <td><a href="#" className="btn btn-xs btn-danger" onClick={@_deleteItem.bind @}>&times;</a></td>
      </tr>
    )

  _deleteItem: (e) ->
    e.preventDefault()
    FsResource.removeItem @fsObject, (data) =>
      if @fsObject.type == "file"
        SelectionStorage.remove @fsObject
      else
        SelectionStorage.clear()
    , (err) ->
      # TODO: Resolve error

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