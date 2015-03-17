# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
NavigationStorage = require "../storages/NavigationStorage"

class FsItem extends React.Component

  fsObject: {}

  constructor: (props) ->
    super props
    @fsObject = props.fsObject

  render: () ->
    <tr className="RFManager-fsItem" onClick={@_onClick.bind @}>
      <td>{@fsObject.name}</td>
    </tr>

  _onClick: () ->
    if @fsObject.type == "directory"
      NavigationStorage.add @fsObject

module.exports = FsItem