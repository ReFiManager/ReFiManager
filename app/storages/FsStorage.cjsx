# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

FsResource = require "../resources/FsResource"
NavigationStorage = require "./NavigationStorage"

class FsStorage

  getDirectoryContent: (path) ->
    return FsResource.get("directory", path)

  createDirectory: (name) ->
    data =
      name: name
      currentDirectory: NavigationStorage.getCurrent().path
    return FsResource.post "directory", data

  remove: (type, path) ->
    return FsResource.delete(type, path)

  uploadFiles: (form, files) ->
    return FsResource.upload form, files, NavigationStorage.getCurrent().path

module.exports = new FsStorage()