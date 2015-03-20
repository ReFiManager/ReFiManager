# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsResource = require "../resources/FsResource"
NavigationStorage = require "../storages/NavigationStorage"

class CreateDirectory extends React.Component

  constructor: (props) ->
    super props
    @state =
      displayForm: false
      name: null

  render: () ->
    <form className="navbar-form navbar-left" role="search" onSubmit={@_onSubmit.bind @}>
      <div className="form-group">
        <input type="text" className="form-control" placeholder="New directory" onChange={@_onChange.bind @} ref="name" />
      </div>
      <button type="submit" className="btn btn-default">Create directory</button>
    </form>

  _onChange: (e) ->
    @setState
      name: e.target.value

  _onSubmit: (e) ->
    e.preventDefault()
    FsResource.createDirectory @state.name, (data) =>
      NavigationStorage.emit(NavigationStorage.UPDATE_EVENT)
      React.findDOMNode(@refs.name).value = '';
    , (err) ->
      # TODO: Resolve error

module.exports = CreateDirectory