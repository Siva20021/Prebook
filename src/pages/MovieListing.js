import React, { useEffect, useState } from "react";
import axios from "axios";
import MovieCard from "../components/MovieCard";
const MovieListing = () => {
    const [allMovies, setAllMovies] = useState('');

    useEffect(() => {
        getMovies();
    }, [])
    const movies = Object.entries(allMovies);
    console.log(movies)
  var API_URL = `https://api.themoviedb.org/3/discover/movie?api_key=${process.env.REACT_APP_API_KEY}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate`;
  console.log(API_URL);
  const getMovies = () => axios.get(API_URL).then(function (response) {
    // console.log(response.data.results)
    const movies = response.data.results;
    setAllMovies(movies)
  });
  return (
    <>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 m-8">
        {
            movies.map((movie,index) => (
                <MovieCard 
                name={movie[1].title} 
                backdrop={movie[1].backdrop_path} 
                overview={movie[1].overview}  
                id={movie[1].id}
                key={index}/>
            ))
        }
        
      </div>
    </>
  );
};

export default MovieListing;
