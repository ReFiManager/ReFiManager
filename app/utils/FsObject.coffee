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
    @validate fsObject
    return fsObject

  validate: (object) ->
    schema = Joi.object().keys
      path: Joi.string().regex(/^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$/).required()
      name: Joi.string().optional()
      type: Joi.string().regex(/^file|directory$/).required()
      "mime-type": Joi.string().optional()
      meta: Joi.object
        created: Joi.date().optional()
        modified: Joi.date().optional()
        size: Joi.number().integer().optional()
      .optional()
    Joi.validate object, schema, (error, object) ->
      if error?
        throw "fsObject invalid error: #{error.message}"


module.exports = new FsObject()