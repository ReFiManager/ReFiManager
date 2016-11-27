/**
 * This file is part of the ReFiManager package.
 * (c) Ondřej Záruba <zarubaondra@gmail.com>
 *
 * For the full copyright and license information, please view
 * the license.md file that was distributed with this source code.
**/

import React, {Component} from 'react'
import {render} from 'react-dom'
import ReFiManager from '../../dist'

class App extends Component {

  render() {
    return (
      <ReFiManager isOpen={false} />
    )
  }

}

render(<App />, document.getElementById('app'))