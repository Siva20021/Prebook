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

    address payable manager=payable(0x61B8A9baFda51De880254d509Aa6B3f12920df25);
    address public customer;

    receive() external payable {}


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
        mapping(uint256=>bool) seatsNotAvail;
    }

    /// movie id  => movie details
    mapping(uint256 => Movie) movies;

    /// intializing the NFT ERC721 and making the manager to the person who deployed it i.e. me :)
    constructor() ERC721("Movie NFT", "MNFT") {
        movies[0].movie="Brahmastra";
        movies[0].showTime="9:00 PM";
        movies[0].showDate="06/09/2022";
        movies[1].movie="Thor: Love and Thunder";
        movies[1].showTime="11:00 PM";
        movies[1].showDate="08/09/2022";
        movies[2].movie="Avatar: The Way of Water";
        movies[2].showTime="11:00 AM";
        movies[2].showDate="11/09/2022";
        movies[3].movie="Black Adam";
        movies[3].showTime="5:00 PM";
        movies[3].showDate="08/09/2022";
    }

    function getter(uint movieId) public view returns(string memory name)
    {
        return movies[movieId].movie;
    }


    //It will return true if that particular seat is not available
    function getSeatsNotAvail(uint _movieId, uint _seatNo) public view returns(bool notAvail) {
        return movies[_movieId].seatsNotAvail[_seatNo];
    }


    function generateNFT(uint256 tokenId) public view returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
            '<style>.base { fill: white; font-family: Algerian; font-size: 15px; }</style>',
            '<style>.head { fill: orange; font-family: Algerian; font-size: 25px; }</style>',
            '<rect width="100%" height="100%" fill="black"/>',
            '<text x="50%" y="33%" class="head" dominant-baseline="middle" text-anchor="middle">',
            getMovieName(tokenId),
            '</text>',
            '<text x="49%" y="53%" class="base" dominant-baseline="middle" text-anchor="middle">',
            "Seat: ",
            getSeat(tokenId),
            '</text>',
            '<text x="49%" y="69%" class="base" dominant-baseline="middle" text-anchor="middle">',
            "Screen  2",
            '</text>',
            '</svg>'
        );
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
    function mint(uint256 _movieId,uint256 _seatNo) public payable returns(uint256) {

        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        Movie storage _movie = movies[_movieId];
        movies[_movieId].seatsNotAvail[_seatNo]=true;
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
    
}
