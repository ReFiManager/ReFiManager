# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
NavigationStorage = require "../storages/NavigationStorage"
SelectionStorage = require "../storages/SelectionStorage"

class ResetButton extends React.Component

  render: () ->
    <a href="#" onClick={@reset.bind @}><i className="glyphicon glyphicon-refresh"></i> Reset</a>

  reset: (e) ->
    e.preventDefault()
    SelectionStorage.clear()
    NavigationStorage.clear()

module.exports = ResetButton