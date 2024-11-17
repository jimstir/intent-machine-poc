import logo from './logo.svg';
import './App.css';
import { Link } from 'react-router-dom';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import TopBar from './Components/TopBar/TopBar';
import Home from './Pages/Home/Home'

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
            <TopBar /> 
            
            <Routes>
              {/* Home Route */}
              <Route
                path="/home"
                element={
                  <div>
                    <Home />
                    
                  </div>
                }
                />
          </Routes>      
        </header>
      </div>
    </Router>
  );
}

export default App;
