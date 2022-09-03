// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";


contract NFT is ERC721URIStorage {
    using Strings for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct Ticket {
        address owner;
        uint256 seatNo ;
        uint256 movieId ;
        string movieName ;
        string showTime ;
    }

    /// NFT token ID  => Ticket 
    mapping(uint256 => Ticket) tickets;
    

    struct Movie {
        string movie ;
        string showTime ;
        string showDate ;
    }

    

    uint256 public movieID ;
    /// movie id  => movie details
    mapping(uint256 => Movie) movies;

    /// intializing the NFT ERC721
    constructor() ERC721("Movie NFT", "MNFT") {}


    function generateNFT(uint256 tokenId) public view returns (string memory) {
        require(tokenId==0);
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
            '<style>.base { fill: white; font-family: Algerian; font-size: 15px; }</style>',
            '<style>.head { fill: orange; font-family: Algerian; font-size: 30px; }</style>',
            '<rect width="100%" height="100%" fill="black"/>',
            '<text x="50%" y="78%" class="head" dominant-baseline="middle" text-anchor="middle">',
            "Brahmastra ",
            '</text>',
            '<text x="49%" y="88%" class="base" dominant-baseline="middle" text-anchor="middle">',
            "Seat 38 ",
            '</text>',
            '<text x="49%" y="94%" class="base" dominant-baseline="middle" text-anchor="middle">',
            "Screen  2",
            '</text>',
            '<image width="350" height="250" xlink:href="https://stat1.bollywoodhungama.in/wp-content/uploads/2022/04/Brahmastra.jpeg"  />'
            '</svg>'
        );
            
// '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
//             '<style>.base { fill: white; font-family: Algerian; font-size: 15px; }</style>',
//             '<style>.head { fill: orange; font-family: Algerian; font-size: 30px; }</style>',
//             '<rect width="100%" height="100%" fill="black"/>',
//             '<text x="50%" y="78%" class="head" dominant-baseline="middle" text-anchor="middle">',
//             Brahmastra
//             </text>,
//             '<text x="49%" y="88%" class="base" dominant-baseline="middle" text-anchor="middle">
//             Seat No. 38
//             </text>,
// '<text x="49%" y="94%" class="base" dominant-baseline="middle" text-anchor="middle">
//             Screen 2
//             </text>
        
//             <image width="350" height="250" xlink:href="https://stat1.bollywoodhungama.in/wp-content/uploads/2022/04/Brahmastra.jpeg"  />,
            
            
            
            
//             '</svg>'
//         );

        return
            string(
                abi.encodePacked(
                    "data:image/svg+xml;base64,",
                    Base64.encode(svg)
                )
            );
    }

    function getSeat(uint256 _tokenId) public view returns(string memory){
        uint256 seat = tickets[_tokenId].seatNo ;
        return seat.toString(); 
    }

    function getMovieName(uint256 _tokenId) public view returns(string memory){
        string memory name = tickets[_tokenId].movieName ;
        return name;
    }

     // to get the final tokenURI for a tokenId with metadata and svg together
    function getTokenURI(uint256 tokenId) public view returns (string memory) {
        bytes memory dataURI = abi.encodePacked(
            "{",
            '"name": "Movie Ticket #',
            tokenId.toString(),
            '",',
            '"description": "Movie ticket as NFT for entry in the theatre",',
            '"image": "',
            generateNFT(tokenId),
            '"',
            "}"
        );
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(dataURI)
                )
            );
    }

     /// to mint a on chain NFT using mint and setting a token URI for the svg
    function mint(uint256 _movieId,uint256 _seatNo) public returns(uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        Movie storage _movie = movies[_movieId];
        tickets[newItemId] = Ticket(
            msg.sender,
            _seatNo,
            _movieId,
            _movie.movie,
            _movie.showTime
        );
        _setTokenURI(newItemId, getTokenURI(newItemId));
        return(newItemId);
    
    }

    function createMovie(string memory _name,string memory _showTime , string memory _showDate) public{
        movies[movieID] = Movie(
            _name , 
            _showTime,
            _showDate
        ) ;
        movieID += 1 ;
    }

    function getMovie(uint256 _movieId) public view returns(Movie memory){
        return movies[_movieId];
    }
    
}
