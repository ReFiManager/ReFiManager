# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

Dispatcher = require("flux").Dispatcher

class FsDispatcher extends Dispatcher

  CHANGE_STATE_EVENT: "change-state-event"

  dispatchChangesStateEvent: () ->
    @dispatch @CHANGE_STATE_EVENT



module.exports = new FsDispatcher()