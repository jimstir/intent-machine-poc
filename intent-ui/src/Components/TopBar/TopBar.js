
import React from 'react';
import { Link } from 'react-router-dom';
import './TopBar.css';

function TopBar() {
  return (
    <div className="top-bar">
      <div className="top-bar-left">
        
        <Link to="/" className="clickable-container"> Home</Link>
        
      </div>

      <div className="top-bar-center">
        <p>Intents</p> 
      </div>

      <div className="top-bar-right">
        
        <button className="top-bar-button">Connect</button>
      </div>
      
    </div>
  );
}

export default TopBar;
