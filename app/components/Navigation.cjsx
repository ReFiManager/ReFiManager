# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
NavigationStorage = require "../storages/NavigationStorage"

class Navigation extends React.Component

  getItems: () ->
    items = []
    for item, i in NavigationStorage.getList()
      items.push <li key={i}>{item.name}</li>

    return items

  render: () ->
    <ul className="RFManager-breadcrumb">
      {@getItems()}
    </ul>

module.exports = Navigation