//SPDX-Liscense-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


//import "hardhat/console.sol";
//import { Base64 } from "./libraries/Base64.sol";

contract WriteComment is ERC1155i, Ownable {
   using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    string private _baseURIextended;

    constructor(string memory baseURI) ERC1155i("comment","COM") {}
    setBaseURI(baseURI);
    
    //only owner can set BaseURI
    function setBaseURI(string memory baseURI) public onlyOwner{
        _baseURIextended = baseURI;
    }
    function _baseURI() internal view override returns (string memory) {
        return _baseURIextended;
    }

     // Override uri method to append token-specific part to the URI.
    function uri(uint256 tokenId) public view override returns (string memory) {
        return string(abi.encodePacked(_baseURIextended, Strings.toString(tokenId), ".json"));
    }

    //mint
    function writeYourComment(string memory tokenURI,uint256 amount) public returns (uint256) {
        _tokenIdCounter.increment();
        uint256 commentTokenId = _tokenIdCounter.current();
    
    _mint(msg.sender, commentTokenId);
    _setTokenURI(commentTokenId, tokenURI);

    return commentTokenId;
    }

}
