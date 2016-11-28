/**
 * This file is part of the ReFiManager package.
 * (c) Ondřej Záruba <zarubaondra@gmail.com>
 *
 * For the full copyright and license information, please view
 * the license.md file that was distributed with this source code.
**/

import React, {Component} from 'react'
import {unstable_renderSubtreeIntoContainer as renderSubtreeIntoContainer} from 'react-dom'
import ReFiManagerPortal from './ReFiManagerPortal'

class ReFiManager extends Component {

  componentWillMount() {
    this.node = document.createElement('div')
    document.body.appendChild(this.node)
    this.renderPortal(this.props)
  }

  componentWillReceiveProps(nextProps) {
    this.renderPortal(nextProps)
  }

  componentWillUnmount() {
    document.body.removeChild(this.node);
  }

  renderPortal(props) {
    renderSubtreeIntoContainer(this, <ReFiManagerPortal {...props} />, this.node)
  }

  render() {
    return null
  }

}

export default ReFiManager