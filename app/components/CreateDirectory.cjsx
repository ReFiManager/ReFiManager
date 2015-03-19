# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsStorage = require "../storages/FsStorage"
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
    FsStorage.createDirectory(@state.name).then (data) =>
      NavigationStorage.emit(NavigationStorage.UPDATE_EVENT)
      React.findDOMNode(this.refs.name).value = '';
    , (err, msg) ->
      console.log msg

module.exports = CreateDirectory