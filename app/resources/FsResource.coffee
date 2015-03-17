# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

reqwest = require "reqwest"

class FsResource

  setBaseUrl: (@baseUrl) ->

  getBaseUrl: () ->
    return @baseUrl

  get: (type, path) ->
    return reqwest @_getOptions(type, "GET", path)

  delete: (type, path) ->
    return reqwest @_getOptions(type, "DELETE", path)

  post: (type, data) ->
    optios = @_getOptions(type, "POST")
    optios.data = data
    return reqwest optios

  upload: (form, files, currentDirectory) ->
    formData = new FormData(form)
    formData.append('currentDirectory', currentDirectory)
    for file in files
      formData.append('file', file)
    xhr = new XMLHttpRequest();
    xhr.open('POST', "#{@baseUrl}/file", true);
    xhr.send(formData);

  _getOptions: (type, method, path) ->
    url = "#{@baseUrl}/#{type}"
    if method != "POST"
      url = "#{url}/#{path}"
    options =
      url: url
      method: method
      type: "json"
    return options

module.exports = new FsResource()