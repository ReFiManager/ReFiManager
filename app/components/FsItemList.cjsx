# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsItem = require "./FsItem"
FsResource = require "../resources/FsResource"
NavigationStorage = require "../storages/NavigationStorage"

class FsItemList extends React.Component

  constructor: (props) ->
    super props
    @state =
      items: []

  componentDidMount: () ->
    NavigationStorage.addUpdateListener(@_onChange.bind @)
    FsResource.get(NavigationStorage.getCurrent()).then (data) =>
      @setState
        items: data

  componentWillUnmount: () ->
    NavigationStorage.removeUpdateListener(@_onChange.bind @)

  getItems: () ->
    items = []
    for item in @state.items
      items.push <FsItem key={item.path} fsObject={item} />

    return items

  render: () ->
    <table className="RFManager-fsItemList">
      <thead>
        <tr>
          <th></th>
          <th>Name</th>
        </tr>
      </thead>
      <tbody>
        {@getItems()}
      </tbody>
    </table>

  _onChange: () ->
     FsResource.get(NavigationStorage.getCurrent()).then (data) =>
      @setState
        items: data

module.exports = FsItemList