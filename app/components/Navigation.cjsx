# This file is part of the RFManager package.
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

  componentDidMount: () ->
    NavigationStorage.addUpdateListener(@_onChange);

  getItems: () ->
    items = []
    list = NavigationStorage.getList()
    for item, i in list
      isLast = i == list.length - 1
      items.push <NavigationItem key={i} fsObject={item} isLast={isLast} />

    return items

  render: () ->
    <ul className="RFManager-breadcrumb">
      {@state.items}
    </ul>

  _onChange: () =>
    @setState
      items: @getItems()


module.exports = Navigation