# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
SelectionStorage = require "../storages/SelectionStorage"
Configurator = require "../Configurator"

class PreviewImage extends React.Component

  constructor: (props) ->
    super props
    fsObject = SelectionStorage.getLastAdded()
    @state =
      fsObject: fsObject
      src: @getSrc(fsObject)

  componentDidMount: () ->
    SelectionStorage.addUpdateListener(@_onChange.bind @)

  componentWillUnmount: () ->
    SelectionStorage.removeUpdateListener(@_onChange.bind @)

  getSrc: (fsObject) ->
    src = "data:image/png;base64,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"
    if fsObject? && fsObject.mimeType?
      if fsObject.mimeType.match /^image\//
        baseUrl = Configurator.getBaseUrl()
        src = "#{baseUrl}/file/#{fsObject.id}"
    return src


  render: () ->
    <img src={@state.src} className="col-lg-12" />

  _onChange: () ->
    fsObject = SelectionStorage.getLastAdded();
    @setState
      fsObject: fsObject
      src: @getSrc(fsObject)


module.exports = PreviewImage