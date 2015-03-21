# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsObject = require "./utils/FsObject"
NavigationStorage = require "./storages/NavigationStorage"
ReFiManager = require "./components/ReFiManager"
Configurator = require "./Configurator"
HttpClient = require "./http/HttpClient"
MessageDispatcher = require "./dispatchers/MessageDispatcher"

if not $?
  throw "Missing jQuery!"

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


$.fn.ReFiManager = (options) ->
  Configurator.setOptions options
  fsObject = FsObject.createInitialObject(options.startDirectory)
  NavigationStorage.add fsObject
  React.render <ReFiManager />, this[0]