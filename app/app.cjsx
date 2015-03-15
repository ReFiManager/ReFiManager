# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
RFManager = require "./components/RFManager"

$.fn.RFManager = (options) ->
  React.render <RFManager />, this[0]