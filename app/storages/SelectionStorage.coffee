# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

store2 = require "store2"
EventEmitter = require("events").EventEmitter

class SelectionStorage extends EventEmitter

  STORAGE_NAME: "RFManager.SelectionStorage"
  STORAGE_KEY: "list"

  UPDATE_EVENT: "update"

  constructor: () ->
    @storage = store2.namespace @STORAGE_NAME
    list = @storage.session @STORAGE_KEY
    if not list?
      @storage.session @STORAGE_KEY, []

  ###
  # Toggle item in storage.
  # If exist will be removed and if
  # not exit will be added into list
  #
  # @param fsObject
  ###
  toggle: (fsObject) ->
    if @exist fsObject
      @remove fsObject
    else
      @add fsObject

  ###
  # Add a new fsObject into selection
  # storage
  #
  # @param fsObject
  ###
  add: (fsObject) ->
    list = @getList()
    if not list?
      list = []
    list.push fsObject
    @storage.session @STORAGE_KEY, list
    @emit @UPDATE_EVENT

  ###
  # Remove fsObject from selection
  # storage
  #
  # @param fsObject
  ###
  remove: (fsObject) ->
    list = @getList()
    for item, i in list
      if item.path == fsObject.path
        list.splice i, 1
        break
    @storage.session @STORAGE_KEY, list
    @emit @UPDATE_EVENT

  ###
  # Check if fsObject exist in storage
  #
  # @param fsObject
  # @return bool
  ###
  exist: (fsObject) ->
    for item in @getList()
      if item.path == fsObject.path
        return true
    return false

  ###
  # Retuns list of fsObject from storage
  #
  # @return fsObject[]
  ###
  getList: () ->
    return @storage.session @STORAGE_KEY

  ###
  # Returns last added fsObject
  #
  # @return fsObject|null
  ###
  getLastAdded: () ->
    list = @getList()
    index = list.length - 1;
    if index < 0
      return null
    return list[index]

  # Events

  ###
  # Register update listenter
  #
  # @param callback
  ###
  addUpdateListener: (callback) ->
    @on @UPDATE_EVENT, callback

  ###
  # Remove useless listener
  #
  # @param callback
  ###
  removeUpdateListener: (callback) ->
    @removeListener(@UPDATE_EVENT, callback);

module.exports = new SelectionStorage()