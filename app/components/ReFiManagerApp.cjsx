# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
Navigation = require "./Navigation"
FsItemList = require "./FsItemList"
SelectionList = require "./SelectionList"
CreateDirectoryModal = require "./CreateDirectoryModal"
UploadFileModal = require "./UploadFileModal"
Messages = require "./Messages"
MessageDispatcher = require "../dispatchers/MessageDispatcher"
ResetButton = require "./ResetButton"

class ReFiManagerApp extends React.Component

  constructor: (props) ->
    super props
    @state =
      message: false

  componentDidMount: () ->
    MessageDispatcher.register (payload) =>
      if payload.event == MessageDispatcher.MESSAGE_EVENT
        @displayMessage(payload.text, payload.type)

  displayMessage: (text, type) ->
    @setState
      message: <Messages text={text} type={type} />

  render: () ->
    <div className="ReFiManager">
      <div className="navbar navbar-default">
        <div className="navbar-header">
          <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span className="sr-only">Toggle navigation</span>
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
          </button>
          <a className="navbar-brand" href="#">ReFiManager</a>
        </div>
        <div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul className="nav navbar-nav">
            <li><a href="#" data-toggle="modal" data-target="##{CreateDirectoryModal.MODAL_IDENTIFIER}"><i className="glyphicon glyphicon-plus"></i> Create directory</a></li>
            <li><a href="#" data-toggle="modal" data-target="##{UploadFileModal.MODAL_IDENTIFIER}"><i className="glyphicon glyphicon-upload"></i> Upload file</a></li>
          </ul>
          <ul className="nav navbar-nav navbar-right">
            <li><ResetButton /></li>
          </ul>
        </div>
      </div>
      <div className="row">
        <SelectionList />
        <div className="col-lg-8">
          {@state.message}
          <Navigation />
          <FsItemList />
        </div>
      </div>
      <div className="clearfix"></div>
      <CreateDirectoryModal />
      <UploadFileModal />
    </div>

module.exports = ReFiManagerApp