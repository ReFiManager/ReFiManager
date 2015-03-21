# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"

class Messages extends React.Component

  constructor: (props) ->
    super props
    @message =
      text: props.text
      type: props.type

  getClass: () ->
    return "alert  alert-#{@message.type} alert-dismissible"

  render: () ->
    <div className={@getClass()} role="alert">
      <button type="button" className="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      {@message.text}
    </div>

module.exports = Messages