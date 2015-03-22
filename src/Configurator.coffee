# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

class Configurator

  setOptions: (@options) ->

  getElement: () ->
    if not @options.element
      throw "Missing target element"
    return @options.element

  getBaseUrl: () ->
    if not @options.baseUrl?
      throw "Missing baseUrl"

    return @options.baseUrl

  getInserter: () ->
    if not @options.inserter?
      throw "Missing inserter"

    return @options.inserter

  getStartDirectory: () ->
    if not @options.startDirectory?
      throw "Missing start directory"
    return @options.startDirectory

  isMultiselectEnabled: () ->
    if not @options.multiselect?
      throw "Missing multiselect option"

    return @options.multiselect

module.exports  = new Configurator()