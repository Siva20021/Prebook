import {Routes,Route,BrowserRouter } from "react-router-dom"
import './App.css';

function App() {
  return (
  <BrowserRouter>
    <div>
      <Routes>
        <Route path="/" element={</>}/>
      </Routes>
    </div>
  </BrowserRouter>
    
  );
}

export default App;
