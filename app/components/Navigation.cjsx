# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
NavigationItem = require "./NavigationItem"
NavigationStorage = require "../storages/NavigationStorage"
FsDispatcher = require "../dispatchers/FsDispatcher"

class Navigation extends React.Component

  constructor: (props) ->
    super props
    @state =
      items: @getItems()

  ###
  # Register listener for NavigationStorage update event
  ###
  componentDidMount: () ->
    FsDispatcher.register (payload) =>
      if payload == FsDispatcher.CHANGE_STATE_EVENT
        @_onChange()

  ###
  # Returns lisf of <NagivationItem /> component
  #
  # @returns <NavigationList />[]
  ###
  getItems: () ->
    items = []
    list = NavigationStorage.getList()
    for item, i in list
      isLast = i == list.length - 1
      items.push <NavigationItem key={item.id} fsObject={item} isLast={isLast} />

    return items

  render: () ->
    <ul className="breadcrumb">
      {@state.items}
    </ul>

  ###
  # Listener for NavigationStore update event
  ###
  _onChange: () =>
    @setState
      items: @getItems()


module.exports = Navigation