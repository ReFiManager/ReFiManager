# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

store2 = require "store2"
EventEmitter = require("events").EventEmitter

class NavigationStorage extends EventEmitter

  STORAGE_NAME: "RFManager.NavigationStorage"
  STORAGE_LIST_KEY: "list"

  UPDATE_EVENT: "update"

  ###
  # Initialize storage and created empty list
  # for NavigationStorage
  ###
  constructor: () ->
    @storage = store2.namespace @STORAGE_NAME
    @storage.session @STORAGE_LIST_KEY, []

  ###
  # Returns current directory (last directory
  # in list). If is list empty throw exception
  #
  # @returns fsObject
  ###
  getCurrent: () ->
    list = @storage.session @STORAGE_LIST_KEY
    index = list.length - 1;
    if index < 0
      throw "Invalid initial state"
    return list[index]

  ###
  # Add a new item into navigation list
  #
  # @param fsObject
  ###
  add: (fsObject) ->
    list = @storage.session(@STORAGE_LIST_KEY)
    list.push(fsObject)
    @storage.session(@STORAGE_LIST_KEY, list)
    @emit(@UPDATE_EVENT)

  ###
  # Remove all items after wanted item
  #
  # @param fsObject
  ###
  goBack: (wanted) ->
    list = @storage.session @STORAGE_LIST_KEY
    for item, i in list
      if item.path == wanted.path
        @storage.session @STORAGE_LIST_KEY, list.slice 0, i + 1
        @emit(@UPDATE_EVENT)
        return

  ###
  # Returns list of fsObject reprezents actual position
  # in folder structure
  #
  # @returns fsObject[]
  ###
  getList: () ->
    return @storage.session @STORAGE_LIST_KEY

  # Events

  ###
  # Register update listener
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

module.exports = new NavigationStorage()