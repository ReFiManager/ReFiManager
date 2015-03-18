# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
SelectionStorage = require "../storages/SelectionStorage"
Configurator = require "../utils/Configurator"

class Inserter extends React.Component

  render: () ->
    <a href="#" className="btn btn-primary btn-block" onClick={@_onClick.bind @}>Insert</a>

  _onClick: (e) ->
    inserter = Configurator.getInserter();
    inserter(SelectionStorage.getList());
    e.preventDefault()


module.exports = Inserter