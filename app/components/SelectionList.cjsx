# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
SelectedItem = require "./SelectedItem"
PreviewImage = require "./PreviewImage"
SelectionStorage = require "../storages/SelectionStorage"
Inserter = require "./Inserter"

class SelectionList extends React.Component

  constructor: (props) ->
    super props
    @state =
      selectedItems: @getItems()

  componentDidMount: () ->
    SelectionStorage.addUpdateListener(@_onChange.bind @)

  componentWillUnmount: () ->
    SelectionStorage.removeUpdateListener(@_onChange.bind @)

  getItems: () ->
    items = []
    for item in SelectionStorage.getList()
      items.push <SelectedItem key={item.id} fsObject={item} />
    return items

  render: () ->
    <div className="col-lg-4" >
      <PreviewImage />
      <div className="clearfix"></div>
      <hr />
      <h4>Selected items:</h4>
      <ul className="list-group">
        {@state.selectedItems}
      </ul>
      <div className="clearfix"></div>
      <Inserter />
    </div>

  _onChange: () ->
    @setState
      selectedItems: @getItems()

module.exports = SelectionList