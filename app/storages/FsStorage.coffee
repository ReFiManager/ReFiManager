# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

reqwest = require "reqwest"

class FsStorage

  setUrl: (@url) ->

  getAll: (directory) ->
    return reqwest
      url: "#{@url}/file-system/"
      type: "json"
      method: "GET"

module.exports = new FsStorage()