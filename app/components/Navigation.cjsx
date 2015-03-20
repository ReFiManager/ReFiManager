# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
NavigationItem = require "./NavigationItem"
NavigationStorage = require "../storages/NavigationStorage"

class Navigation extends React.Component

  constructor: (props) ->
    super props
    @state =
      items: @getItems()

  ###
  # Register listener for NavigationStorage update event
  ###
  componentDidMount: () ->
    NavigationStorage.addUpdateListener(@_onChange);

  ###
  # Remove listener if component is unmounted
  ###
  componentWillUnmount: () ->
    NavigationStorage.removeUpdateListener(@_onChange.bind @)

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
      items.push <NavigationItem key={item.path} fsObject={item} isLast={isLast} />

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