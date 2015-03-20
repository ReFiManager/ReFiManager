# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

Dispatcher = require("flux").Dispatcher

class FsDispatcher extends Dispatcher

  UPDATE_EVENT: "update-event"

  CHANGE_DESTINATION_EVENT: "change-destination-event"

module.exports = new FsDispatcher()