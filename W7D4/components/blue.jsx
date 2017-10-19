import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Indigo from './indigo';


class Blue extends React.Component {
  render() {
    return (
      <div>
        <h2 className="blue"></h2>
        <NavLink to="/blue/indigo">Put a little indigo square in there!</NavLink>

        <Route path="/blue/indigo" component={Indigo} />
      </div>
    );
  }
};

export default Blue;
