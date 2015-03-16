# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

Joi = require "joi"

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

  validate: (object) ->
    schema = Joi.object().keys
      path: Joi.string().regex(/^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$/)
      name: Joi.string()
      type: Joi.string().regex(/^file|directory$/)
      "mime-type": Joi.string()
      meta: Joi.object
        created: Joi.date()
        modified: Joi.date()
        size: Joi.number().integer()
    .with "path", "type"
    .without "name", "mete", "mime-type"

    console.log Joi.validate object, schema


module.exports = new FsObject()