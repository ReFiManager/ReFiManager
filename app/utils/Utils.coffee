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

module.exports = new Utils()