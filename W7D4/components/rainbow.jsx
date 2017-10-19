import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';


class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>

          <NavLink exact to='/red'>Make a red square</NavLink>
          <NavLink to='/green' >Make a green square</NavLink>
          <NavLink exact to='/blue' >Make a blue square</NavLink>
          <NavLink to='/violet' >Make a violet square</NavLink>

        <div id="rainbow">
          <Route path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
        </div>

      </div>
    );
  }
};

export default Rainbow;
