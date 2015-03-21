# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsResource = require "../resources/FsResource"

class UploadFileModal extends React.Component

  @MODAL_IDENTIFIER = "ReFiManager-uploadFiles-modal"

  constructor: (props) ->
    super props
    @state =
      files: null

  render: () ->
    <div className="modal fade" id={UploadFileModal.MODAL_IDENTIFIER} tabIndex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div className="modal-dialog">
        <div className="modal-content">
          <div className="modal-header">
            <button type="button" className="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 className="modal-title" id="myModalLabel">Upload file(s)</h4>
          </div>
          <div className="modal-body">
            <form encType="multipart/form-data" onSubmit={@_onSubmit.bind @}>
              <div className="form-group">
                <label htmlFor="ReFiManager-directoryName">Selec files</label>
                <input type="file" onChange={@_onChange.bind @} ref="file" multiple />
              </div>
            </form>
          </div>
          <div className="modal-footer">
            <button type="button" className="btn btn-primary" onClick={@_onSubmit.bind @}>Upload file(s)</button>
            <button type="button" className="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>

  _onSubmit: (e) ->
    $("##{UploadFileModal.MODAL_IDENTIFIER}").modal("hide")
    e.preventDefault()
    FsResource.uploadFiles @state.files, (data) =>
      React.findDOMNode(this.refs.file).value = '';
    , (err) ->
      # TODO: Resolve error

  _onChange: (e) ->
    @setState
      files: e.target.files

module.exports = UploadFileModal