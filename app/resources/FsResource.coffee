# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

reqwest = require "reqwest"
Configurator = require "../Configurator"
HttpClient = require "../http/HttpClient"
UrlFactory = require "../http/UrlFactory"
NavigationStorage = require "../storages/NavigationStorage"

class FsResource

  getDirectoryContent: (fsObject, successCallback, errorCallback) ->
    url = UrlFactory.getUrl fsObject.type, fsObject.path
    HttpClient.get url, null, successCallback, errorCallback

  removeItem: (fsObject, successCallback, errorCallback) ->
    url = UrlFactory.getUrl fsObject.type, fsObject.path
    HttpClient.delete url, successCallback, errorCallback

  createDirectory: (name, successCallback, errorCallback) ->
    data =
      currentDirectory: NavigationStorage.getCurrent().path
      name: name
    url = UrlFactory.getUrl "directory"
    HttpClient.post url, JSON.stringify(data), successCallback, errorCallback

  uploadFiles: (files, successCallback, errorCallback) ->
    url = UrlFactory.getUrl "file"
    for file in files
      data = new FormData()
      data.append "currentDirectory", NavigationStorage.getCurrent().path
      data.append "file", file
      HttpClient.upload url, data, successCallback, errorCallback

module.exports = new FsResource()