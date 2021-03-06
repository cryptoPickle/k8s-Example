import React, { Component } from "react";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import Fib from "./Fib";
import OtherPage from "./OtherPage";
import logo from "./logo.svg";
import "./App.css";

class App extends Component {
  render() {
    console.log('Update v1.0.1')
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1 className="App-title">Welcome to Fib Calculator v1</h1>
            <Link to='/'>Home</Link>
            <Link to='/otherpage'>Other Page</Link>
          </header>
          <div>
            <Route exact path='/' component={Fib} />
            <Route path='/otherpage' component={OtherPage} />
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
