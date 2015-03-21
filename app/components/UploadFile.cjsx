# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsResource = require "../resources/FsResource"

class UploadFile extends React.Component

  constructor: (props) ->
    super props
    @state =
      files: null

  render: () ->
    <form className="navbar-form navbar-left" role="search" encType="multipart/form-data" onSubmit={@_onSubmit.bind @}>
      <div className="form-group">
        <input type="file" onChange={@_onChange.bind @} ref="file" multiple />
      </div>
      <button type="submit" className="btn btn-default">Upload</button>
    </form>

  _onSubmit: (e) ->
    e.preventDefault()
    FsResource.uploadFiles @state.files, (data) =>
      React.findDOMNode(this.refs.file).value = '';
    , (err) ->
      # TODO: Resolve error

  _onChange: (e) ->
    @setState
      files: e.target.files

module.exports = UploadFile