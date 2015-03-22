# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

Dispatcher = require("flux").Dispatcher

class MessageDispatcher extends Dispatcher

  MESSAGE_EVENT: "event-message"

  dispatchMessageEvent: (message, type) ->
    @dispatch
      event: @MESSAGE_EVENT
      text: message
      type: type


module.exports = new MessageDispatcher()