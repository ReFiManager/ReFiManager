# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsObject = require "./utils/FsObject"
NavigationStorage = require "./storages/NavigationStorage"
RFManager = require "./components/RFManager"
FsResource = require "./resources/FsResource"
Configurator = require "./utils/Configurator"

if not $?
  throw "Missing jQuery!"

$.fn.RFManager = (options) ->
  Configurator.configure options
  fsObject = FsObject.createInitialObject(options.startDirectory)
  NavigationStorage.add fsObject
  FsResource.setBaseUrl options.baseUrl
  React.render <RFManager />, this[0]