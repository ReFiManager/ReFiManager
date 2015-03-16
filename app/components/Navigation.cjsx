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
    list = NavigationStorage.getList()
    for item, i in list
      if i == list.length - 1
        items.push <li className="active" key={i + 1}>{item.name}</li>
      else
        items.push <li key={i}><a href="">{item.name}</a></li>

    return items

  render: () ->
    <ul className="RFManager-breadcrumb">
      {@getItems()}
    </ul>

module.exports = Navigation