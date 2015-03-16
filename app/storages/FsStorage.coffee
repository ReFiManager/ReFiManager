# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

reqwest = require "reqwest"

class FsStorage

  setUrl: (@url) ->

  getContent: () ->
    options = @_createRequest({type:"directory", id: "45"}, "GET")
    return reqwest(options)

  delete: () ->

  create: () ->

  _createRequest: (fsObject, method) ->
    url = "#{@url}/#{fsObject.type}"
    if method != "POST"
      console.log "ASDSAD"
      url = "#{url}/#{fsObject.id}"
    options =
      url: url
      type: "json"
      method: method
    return options



module.exports = new FsStorage()