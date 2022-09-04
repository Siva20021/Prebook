import React from 'react'
import {Link} from "react-router-dom"
function Header() {
  return (
    <div>
        <nav className="bg-[#A91079] text-black-700 flex h-[50px] fixed w-[100%]">
                <div className='w-[20px]'></div> 
                <div><img alt="Header-logo" src="../images/prebook.jpeg" className='h-[40px] w-[130px] mt-[10px] rounded-[20px] mr-[150px]'/></div>           
                <input type="text" className=" hidden lg:block  pl-[10px] mt-[5px] h-[30px] w-[300px] rounded-[20px] text-[10px] text-left focus:outline-none" placeholder='Search Movies'/>
                <ul className=' h-[30px] flex flex-row'>
                    <li className=' hidden xl:block   cursor-pointer text-[25px] ml-[15px] w-[200px] h-[30px] box-content  hover:bg-yellow-400 rounded-[20px] pb-[5px] pl-[20px] drop-shadow-none'>Home</li>
                    <li className='  hidden xl:block cursor-pointer text-[25px] ml-[15px] w-[200px] h-[30px] box-content hover:bg-yellow-400  rounded-[20px] pb-[5px] pl-[20px] drop-shadow-none'><Link to="/movies">Movies</Link></li>
                    <li className=' hidden xl:block  cursor-pointer text-[25px] ml-[15px] w-[200px] h-[30px] box-content hover:bg-yellow-400 rounded-[20px] pb-[5px] pl-[20px] drop-shadow-none'>About</li>
                    <button className=' text-lg text-white font-bold  w-[180px] h-[50px] rounded-[10px] pt-0 hover:bg-[ #FBCB0A]'>Connect Wallet</button>
                </ul>
        </nav>
    </div>
  )
}

export default Header;
