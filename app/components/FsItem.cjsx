# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"

class FsItem extends React.Component

  render: () ->
    <li>{@props.name}</li>

module.exports = FsItem