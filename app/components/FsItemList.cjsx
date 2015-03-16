# This file is part of the RFManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

React = require "react"
FsItem = require "./FsItem"

class FsItemList extends React.Component

  render: () ->
    <table className="RFManager-fsItemList">
      <thead>
        <tr>
          <th></th>
          <th>Name</th>
        </tr>
      </thead>
      <tbody>
        <FsItem />
      </tbody>
    </table>

module.exports = FsItemList