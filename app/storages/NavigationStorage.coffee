# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

store2 = require "store2"
FsDispatcher = require "../dispatchers/FsDispatcher"

class NavigationStorage

  STORAGE_NAME: "ReFiManager.NavigationStorage"
  STORAGE_LIST_KEY: "list"

  ###
  # Initialize storage and created empty list
  # for NavigationStorage
  ###
  constructor: () ->
    @storage = store2.namespace @STORAGE_NAME
    list = @storage.session @STORAGE_LIST_KEY
    if not list?
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
    if not @exist(fsObject)
      list = @storage.session(@STORAGE_LIST_KEY)
      list.push(fsObject)
      @storage.session(@STORAGE_LIST_KEY, list)
      FsDispatcher.dispatchChangesStateEvent()

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
        FsDispatcher.dispatchChangesStateEvent()
        return

  exist: (fsObject) ->
    for item in @getList()
      if item.path == fsObject.path
        return true
    return false

  ###
  # Returns list of fsObject reprezents actual position
  # in folder structure
  #
  # @returns fsObject[]
  ###
  getList: () ->
    return @storage.session @STORAGE_LIST_KEY

module.exports = new NavigationStorage()