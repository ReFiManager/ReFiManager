# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

class HttpRequest

  headers: []
  successCallbacks: []
  errorCallbacks: []

  data: null

  ###
  # Create XMLHttpRequest
  ###
  constructor: (method, url) ->
    @xhr = new XMLHttpRequest()
    @xhr.open method, url, true

  ###
  # Set callbacks for success response
  #
  # @param []
  ###
  setSuccessCallbacks: (successCallbacks) ->
    @successCallbacks = successCallbacks || []

  ###
  # Set callbacks for failed response
  #
  # @param []
  ###
  setErrorCallbacks: (errorCallbacks) ->
    @errorCallbacks = errorCallbacks || []

  ###
  # Set default headers for request
  #
  # @param []
  ###
  setHeaders: (headers) ->
    @headers = headers || []

  ###
  # Add header for request
  # If header exist will be updated
  #
  # @param string
  # @param string
  ###
  addHeader: (name, value) ->
    @headers.push {name: name, value: value}

  ###
  # Set request data
  #
  # @param mixed
  ###
  setData: (@data) ->

  ###
  # Invoke headers and callbacks and send request
  ###
  send: () ->
    @invokeHeaders()
    self = @
    @xhr.onreadystatechange = () ->
      if @readyState == 4
        isSuccess = (@status >= 200 && @status < 300)
        data = null
        if @responseText
          data = JSON.parse @responseText
        self.fireEvents isSuccess, data
    @xhr.send(@data)

  ###
  # Call callbacks
  #
  # @param bool
  # @param mixed
  # @private
  ###
  fireEvents: (isSuccess, data) ->
    if isSuccess
      for callback in @successCallbacks
        callback data
    else
      for callback in @errorCallbacks
        callback data

  ###
  # Invoke headers
  #
  # @private
  ###
  invokeHeaders: () ->
    for header in @headers
      @xhr.setRequestHeader header.name, header.value

module.exports = HttpRequest