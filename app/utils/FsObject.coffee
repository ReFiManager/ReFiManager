# This file is part of the ReFiManager package.
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
      path: path
      name: "Root"
      type: @DIRECTORY_TYPE
    @validate fsObject
    return fsObject

  validate: (object) ->
    schema = Joi.object().keys
      path: Joi.string().required()
      name: Joi.string().optional()
      type: Joi.string().regex(/^file|directory$/).required()
      mimeType: Joi.string().optional()
      meta: Joi.object
        created: Joi.date().optional()
        modified: Joi.date().optional()
        size: Joi.number().integer().optional()
      .optional()
    Joi.validate object, schema, (error, object) ->
      if error?
        throw "fsObject invalid error: #{error.message}"


module.exports = new FsObject()