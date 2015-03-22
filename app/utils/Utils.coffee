# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

class Utils

  arrayCopy: (source) ->
    result = []
    for item in source
      result.push item
    return result

  truncate: (input, length) ->
    if input.length + 3 >= length
      input = "#{input.substr 0, length}..."
    return input

  byteToReadbleFormat: (bytes) ->
    if (tb = bytes / 1000000000000) > 1 # test if is TB (10^12)
      return "#{parseFloat(tb).toFixed(2)} TB"
    else if (gb = bytes / 1000000000) > 1 # test if is GB (10^9)
      return "#{parseFloat(gb).toFixed(2)} GB"
    else if (mb = bytes / 1000000) > 1 # test if is MB (10^6)
      return "#{parseFloat(mb).toFixed(2)} MB"
    else if (kb = bytes / 1000) > 1 # test if is KB (10^3)
      return "#{parseFloat(kb).toFixed(2)} kB"
    else
      return "#{parseFloat(b).toFixed(2)} B"

module.exports = new Utils()