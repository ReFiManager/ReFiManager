# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
NavigationStorage = require "../storages/NavigationStorage"

class NavigationItem extends React.Component

  fsObject: {}

  constructor: (props) ->
    super props
    @fsObject = props.fsObject

  render: () ->
    if @props.isLast
      return <li className="active">{@fsObject.name}</li>
    else
      return <li><a href="#" onClick={@_onClick.bind @}>{@fsObject.name}</a></li>

  ###
  # Go back
  ###
  _onClick: (e) ->
    NavigationStorage.goBack(@fsObject)
    e.stopPropagation()


module.exports = NavigationItem