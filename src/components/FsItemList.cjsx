# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsItem = require "./FsItem"
NavigationStorage = require "../storages/NavigationStorage"
FsResource = require "../resources/FsResource"
FsDispatcher = require "../dispatchers/FsDispatcher"
SelectionStorage = require "../storages/SelectionStorage"
Configurator = require "../Configurator"

class FsItemList extends React.Component

  constructor: (props) ->
    super props
    @state =
      items: []
      checkedAll: false

  componentDidMount: () ->
    FsDispatcher.register (payload) =>
      if payload == FsDispatcher.CHANGE_STATE_EVENT
        @_onChange()
    FsResource.getDirectoryContent NavigationStorage.getCurrent(), (response) =>
      @setState
        items: response.data
    , (err) =>
      # TODO: Resolve error

  getItems: () ->
    items = []
    for item in @state.items
      items.push <FsItem key={item.id} fsObject={item} />

    return items

  isDisabled: () ->
    return not Configurator.isMultiselectEnabled()

  render: () ->
    <table className="table table-hover">
      <thead>
        <tr>
          <th style={width: "15px"}><input type="checkbox" onChange={@toggleAll.bind @} disabled={@isDisabled()} /></th>
          <th>Name</th>
          <th style={width: "150px"}>Created</th>
          <th>Size</th>
          <th style={width: "15px"}></th>
        </tr>
      </thead>
      <tbody>
        {@getItems()}
      </tbody>
    </table>

  toggleAll: (e) ->
    @setState
      checkedAll: not @state.checkedAll
    , () ->
      if @state.checkedAll
        for item in @state.items
          if not SelectionStorage.exist item
            SelectionStorage.add item
      else
        for item in @state.items
          SelectionStorage.remove item

  _onChange: () ->
    FsResource.getDirectoryContent NavigationStorage.getCurrent(), (response) =>
      @setState
        items: response.data
    , (err) =>
      # TODO: Resolve error

module.exports = FsItemList