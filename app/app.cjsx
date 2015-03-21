# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

ReFiManager = require "./ReFiManager"

window.ReFiManager = ReFiManager

if $?
  $.fn.ReFiManager = (options) ->
    ReFiManager.create(this[0], options)