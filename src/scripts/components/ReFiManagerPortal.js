/**
 * This file is part of the ReFiManager package.
 * (c) Ondřej Záruba <zarubaondra@gmail.com>
 *
 * For the full copyright and license information, please view
 * the license.md file that was distributed with this source code.
**/

import React, {Component, PropTypes} from 'react'

class ReFiManagerPortal extends Component {

  static propTypes = {
    isOpen: PropTypes.bool.isRequired
  }

  render() {

    const {isOpen} = this.props

    if (!isOpen) {
      return null
    }

    return (
      <div className="__refimanager__container">
        test
      </div>
    )
  }

}

export default ReFiManagerPortal