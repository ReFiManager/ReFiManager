# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

reqwest = require "reqwest"

class FsResource

  setBaseUrl: (@baseUrl) ->

  get: (fsObject) ->
    return reqwest @_getOptions(fsObject, "GET")

  delete: () ->
    return reqwest @_getOptions(fsObject, "DELETE")

  _getOptions: (fsObject, method) ->
    options =
      url: "#{@baseUrl}/#{fsObject.type}/#{fsObject.path}"
      method: method
      type: "json"
    return options

module.exports = new FsResource()