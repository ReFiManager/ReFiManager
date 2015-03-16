# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"

class NavigationItem extends React.Component

  render: () ->
    if @props.isLast
      return <li className="active" key={@props.fsObject.path}>{@props.fsObject.name}</li>
    else
      return <li key={@props.fsObject.path}><a href="">{@props.fsObject.name}</a></li>

module.exports = NavigationItem