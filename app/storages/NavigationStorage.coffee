# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

store2 = require "store2"

class NavigationStorage

  STORAGE_NAME: "RFManager.NavigationStorage"
  STORAGE_LIST_KEY: "list"

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
  # @returns FsObject
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
  # @param FsObject
  ###
  add: (FsObject) ->
    list = @storage.session(@STORAGE_LIST_KEY)
    list.push(FsObject)
    @storage.session(@STORAGE_LIST_KEY, list)

  ###
  # Remove all items after wanted item
  #
  # @param FsObject
  ###
  goBack: (wanted) ->
    list = @storage.session @STORAGE_LIST_KEY
    for item, i in list
      if item.path == wanted.path
        @storage.session @STORAGE_LIST_KEY, list.slice 0, i + 1
        return

module.exports = new NavigationStorage()