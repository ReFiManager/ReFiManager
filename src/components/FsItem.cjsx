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
moment = require "moment"
Configurator = require "../Configurator"

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

  getDate: () ->
    date = ""
    if @fsObject.meta? && @fsObject.meta.created?
      date = moment(@fsObject.meta.created, "X").format("DD.MM.YYYY HH:mm:ss")

    return date

  getSize: () ->
    size = ""
    if @fsObject.meta? && @fsObject.meta.size? && @fsObject.type != "directory"
      size = Utils.byteToReadbleFormat @fsObject.meta.size

    return size

  isDisabled: () ->
    if Configurator.isMultiselectEnabled()
      return false
    else
      return SelectionStorage.getList().length > 0 && not @state.selected

  render: () ->
    if @fsObject.type == "directory"
      val = <a href="#" onClick={@_moveInto.bind @} title={@fsObject.name}>{Utils.truncate @fsObject.name, @maxLength}</a>
    else
      val = <span title={@fsObject.name}>{Utils.truncate @fsObject.name, @maxLength}</span>
    return (
      <tr className="ReFiManager-fsItem">
        <td><input type="checkbox" checked={@state.selected} onChange={@_onToggleSelect.bind @} disabled={@isDisabled()} /></td>
        <td>{val}</td>
        <td>{@getDate()}</td>
        <td>{@getSize()}</td>
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