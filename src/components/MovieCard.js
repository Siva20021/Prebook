import React from 'react'
import { Link } from 'react-router-dom'
const MovieCard = ({name, key, backdrop, overview, id}) => {
    
  return (
    <div key={key} className="flex-col mx-auto">
        <img src={`https://image.tmdb.org/t/p/w500${backdrop}`} alt="Poster" width={500} /> 
        <div className='max-w-[500px]'>
        <p className='text-2xl font-semibold mt-2'>{name}</p>
        <p className='text-justify text-lg mt-2'>{overview}</p>
        <Link to={`/booking/${id}`}>
        <button className='p-2 bg-green-400 font-bold text-lg rounded-xl mt-4 text-white hover:scale-110'>Book a show</button>
        </Link>
        </div>
    </div>
  )
}

export default MovieCard