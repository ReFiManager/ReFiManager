# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
Configurator = require "./Configurator"
FsObject = require "./utils/FsObject"
NavigationStorage = require "./storages/NavigationStorage"
HttpClient = require "./http/HttpClient"
ReFiManagerApp = require "./components/ReFiManagerApp"
MessageDispatcher = require "./dispatchers/MessageDispatcher"

class ReFiManager

  create: (element, options) ->
    options = options || {}
    options.element = element
    @initialize options
    React.render <ReFiManagerApp />, element

  initialize: (options) ->
    Configurator.setOptions options

    fsObject = FsObject.createInitialObject(options.startDirectory)
    NavigationStorage.add fsObject

    HttpClient.addErrorCallback (data) ->
      if data? && typeof(data) == "object" && data.message?
        MessageDispatcher.dispatchMessageEvent data.message.text, data.message.type

    HttpClient.addSuccessCallback (data) ->
      if data? && typeof(data) == "object" && data.message?
        MessageDispatcher.dispatchMessageEvent data.message.text, data.message.type

    HttpClient.addSuccessCallback (response) ->
      if response? && response.data?
        if Array.isArray(response.data)
          for item in response.data
            FsObject.validate item
        else
          FsObject.validate response.data

module.exports = new ReFiManager()