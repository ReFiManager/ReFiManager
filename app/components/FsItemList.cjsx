# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsItem = require "./FsItem"
NavigationStorage = require "../storages/NavigationStorage"
FsResource = require "../resources/FsResource"

class FsItemList extends React.Component

  constructor: (props) ->
    super props
    @state =
      items: []

  componentDidMount: () ->
    NavigationStorage.addUpdateListener(@_onChange.bind @)
    FsResource.getDirectoryContent NavigationStorage.getCurrent(), (data) =>
      @setState
        items: data
    , (err) =>
      # TODO: Resolve error

  componentWillUnmount: () ->
    NavigationStorage.removeUpdateListener(@_onChange.bind @)

  getItems: () ->
    items = []
    for item in @state.items
      items.push <FsItem key={item.path} fsObject={item} />

    return items

  render: () ->
    <table className="table table-hover">
      <thead>
        <tr>
          <th></th>
          <th>Name</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        {@getItems()}
      </tbody>
    </table>

  _onChange: () ->
    FsResource.getDirectoryContent NavigationStorage.getCurrent(), (data) =>
      @setState
        items: data
    , (err) =>
      # TODO: Resolve error

module.exports = FsItemList