# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

class FsObject

  FILE_TYPE: "file"
  DIRECTORY_TYPE: "directory"

  ###
  # Create initial fsObject from start directory
  #
  # @returns fsObject
  ###
  createInitialObject: (path) ->
    fsObject =
      path: btoa path
      name: "Root"
      type: @DIRECTORY_TYPE
      "mime-type": null
    return fsObject

module.exports = new FsObject()