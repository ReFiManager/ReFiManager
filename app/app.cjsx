# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsObject = require "./utils/FsObject"
NavigationStorage = require "./storages/NavigationStorage"

if not $?
  throw "Missing jQuery!"

$.fn.RFManager = (options) ->
  fsObject = FsObject.createInitialObject(options.startDirectory)
  NavigationStorage.add fsObject