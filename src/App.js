import {Routes,Route,BrowserRouter } from "react-router-dom"
import './App.css';
import MovieListing from "./pages/MovieListing";
import SeatBooking from "./pages/SeatBooking";
import TicketBooking from "./pages/TicketBooking";
function App() {
  return (
  <BrowserRouter>
    <div>
      <Routes>
        <Route path="/" element={<TicketBooking/>}/>
        <Route path="/movies" element={<MovieListing />} />
        <Route path="/booking/:movieid" element={<SeatBooking />} />
      </Routes>
    </div>
  </BrowserRouter>
    
  );
}

export default App;
