# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsResource = require "../resources/FsResource"
FsDispatcher = require "../dispatchers/FsDispatcher"

class CreateDirectoryModal extends React.Component

  @MODAL_IDENTIFIER = "ReFiManager-createDirectory-modal"

  constructor: (props) ->
    super props
    @state =
      name: null

  render: () ->
    <div className="modal fade" id={CreateDirectoryModal.MODAL_IDENTIFIER} tabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div className="modal-dialog">
          <div className="modal-content">
            <div className="modal-header">
              <button type="button" className="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 className="modal-title" id="myModalLabel">Create directory</h4>
            </div>
            <div className="modal-body">
              <form onSubmit={@_onSubmit.bind @}>
                <div className="form-group">
                  <label htmlFor="ReFiManager-directoryName">Directory name</label>
                  <input id="ReFiManager-directoryName" type="text" className="form-control" placeholder="New directory" onChange={@_onChange.bind @} ref="name" />
                </div>
              </form>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-primary" onClick={@_onSubmit.bind @}>Create directory</button>
              <button type="button" className="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>

  _onChange: (e) ->
    @setState
      name: e.target.value

  _onSubmit: (e) ->
    $("##{CreateDirectoryModal.MODAL_IDENTIFIER}").modal("hide")
    e.preventDefault()
    FsResource.createDirectory @state.name, (data) =>
      React.findDOMNode(@refs.name).value = '';
    , (err) ->
      # TODO: Resolve error

module.exports = CreateDirectoryModal