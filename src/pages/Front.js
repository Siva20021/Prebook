import React from "react";
import Header from "../components/Header"

import {Link} from "react-router-dom"
function Front() {
  return (
    <>
      <div className="absolute flex top-0 left-0 height-[20%] w-[100%] ">
        
        <Header/>
        <div className="pt-[20%] pl-[30%]">
          <h1 className="animate-bounce text-[64px] ">Welcome to Prebook</h1>
          <button className="p-2 ml-[50%] bg-green-400 font-bold text-lg rounded-xl mt-4 text-black hover:scale-110"><Link to="/movies">Movies</Link></button>
        </div>
        
      </div>
    </>
  );
}

export default Front;
