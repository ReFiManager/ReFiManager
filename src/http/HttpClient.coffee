# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

HttpRequest = require "./HttpRequest"
UrlFactory = require "./UrlFactory"
Utils = require "../utils/Utils"

class HttpClient

  successCallbacks: []
  errorCallbacks: []

  addSuccessCallback: (callback) ->
    @successCallbacks.push callback

  addErrorCallback: (callback) ->
    @errorCallbacks.push callback

  get: (url, queries, successCallback, errorCallback) ->
    url = UrlFactory.addQueries url, queries
    request = @createRequest("GET", url, successCallback, errorCallback)
    request.addHeader "Accept", "application/json"
    request.send()

  delete: (url, successCallback, errorCallback) ->
    request = @createRequest "DELETE", url, successCallback, errorCallback
    request.send()

  post: (url, data, successCallback, errorCallback) ->
    request = @createRequest "POST", url, successCallback, errorCallback
    request.addHeader "Content-Type", "application/json"
    request.setData data
    request.send()

  upload: (url, data, successCallback, errorCallback) ->
    request = @createRequest "POST", url, successCallback, errorCallback
    request.setData data
    request.send()

  createRequest: (method, url, successCallback, errorCallback) ->
    request = new HttpRequest(method, url)
    successCallbacks = @getCallbacksForRequest @successCallbacks, successCallback
    errorCallbacks = @getCallbacksForRequest @errorCallbacks, errorCallback
    request.setSuccessCallbacks successCallbacks
    request.setErrorCallbacks errorCallbacks
    return request

  getCallbacksForRequest: (defaultCallbacks, callback) ->
    result = Utils.arrayCopy defaultCallbacks
    if typeof (callback) == "function"
      result.push callback
    else if Array.isArray(callback)
      for item in callback
        result.push item
    else
      throw "Invalid callback"
    return result

module.exports = new HttpClient()