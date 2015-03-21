# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
Navigation = require "./Navigation"
FsItemList = require "./FsItemList"
SelectBar = require "./SelectBar"
CreateDirectory = require "./CreateDirectory"
UploadFile = require "./UploadFile"
Messages = require "./Messages"
MessageDispatcher = require "../dispatchers/MessageDispatcher"

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
          <CreateDirectory />
          <UploadFile />
        </div>
      </div>
      <div className="row">
        <SelectBar />
        <div className="col-lg-8">
          {@state.message}
          <Navigation />
          <FsItemList />
        </div>
      </div>
      <div className="clearfix"></div>
    </div>

module.exports = ReFiManagerApp