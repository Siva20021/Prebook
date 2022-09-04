import React from 'react'
import {Link} from "react-router-dom"
import Footer from '../components/Footer'
import Header from '../components/Header'
function Front() {
  return (
    <div className='p-0'>
        <Header/>
        <div className="bg-[#2E0249] pb-[100px] h-[1000px]">
            <div className="flex justify-center items-center ">
                <p className='text-[50px] mt-[20%] text-orange-600 font-bold m-[20px] animate-bounce'>Welcome to Prebook</p>
            </div>
            <div>
                <button className='ml-[50%] text-[#fff]'><Link to="/movies">MoviesPage</Link></button>
            </div>
        </div>
        
    </div>
  )
}

export default Front
