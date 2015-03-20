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

if not $?
  throw "Missing jQuery!"

$.fn.ReFiManager = (options) ->
  Configurator.setOptions options
  fsObject = FsObject.createInitialObject(options.startDirectory)
  NavigationStorage.add fsObject
  React.render <ReFiManager />, this[0]