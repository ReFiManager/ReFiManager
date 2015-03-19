# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

reqwest = require "reqwest"
Configurator = require "../Configurator"

class FsResource

  get: (type, path) ->
    return reqwest @_getOptions(type, "GET", path)

  delete: (type, path) ->
    return reqwest @_getOptions(type, "DELETE", path)

  post: (type, data) ->
    optios = @_getOptions(type, "POST")
    optios.data = JSON.stringify(data)
    return reqwest optios

  upload: (form, files, currentDirectory) ->
    baseUrl = Configurator.getBaseUrl()
    formData = new FormData(form)
    formData.append('currentDirectory', currentDirectory)
    for file, i in files
      formData.append("file_#{i}", file)
    xhr = new XMLHttpRequest();
    xhr.open('POST', "#{baseUrl}/file", true);
    xhr.send(formData);

  _getOptions: (type, method, path) ->
    baseUrl = Configurator.getBaseUrl()
    url = "#{baseUrl}/#{type}"
    if method != "POST"
      url = "#{url}/#{path}"
    options =
      url: url
      method: method
      type: "json"
      contentType: 'application/json'
    return options

module.exports = new FsResource()