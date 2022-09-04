import React from 'react'

const Footer = () => {
  return (
    <div className='p-[80px 60px] h-72 md:h-80 sm:h-[300px] xs:h-96 w-[100%] bg-red-500'>
       <div className='grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 m-8 mt-0'>
            <div className='grid'>
                <h1 className='text font-bold text-[32px]'>Contact US</h1>
                <span>6383478023</span>
            </div>
            <div className='grid'>
                <h2 className='text font-bold text-[32px]'>Email Id</h2>
                <span className='text font-bold text-[16px]'>sivaramakrishnan365@gmail.com</span>
            </div>
            <div className='grid'>
                <h2 className='text font-bold text-[32px]'>Made with</h2>
                <span><img src="https://cdn.iconscout.com/icon/free/png-256/polygon-logo-colored-5728878-4816868.png" className='h-[80px]'></img></span>    
                <span><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/1200px-React-icon.svg.png" className='h-[50px]'></img></span>            
            </div>

       </div>
    </div>
  )
}

export default Footer
