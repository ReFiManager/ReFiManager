# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

class Configurator

  configure: (@options) ->

  getBaseUrl: () ->
    if not @options.baseUrl?
      throw "Missing baseUrl"

    return @options.baseUrl

  getInserter: () ->
    if not @options.inserter?
      throw "Missing inserter"

    return @options.inserter

module.exports  = new Configurator()