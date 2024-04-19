//SPDX-Liscense-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";
//import { Base64 } from "./libraries/Base64.sol";

contract WriteComment is ERC1155i, Ownable {
   using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    string private _baseURIextended;

    constructor(string memory baseURI) ERC1155i("comment","COM") {
            console.log("This is present for you"); 
            //it will be deleted after test
    }
    setBaseURI(baseURI);
    
    //Soulbound Token
    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
    internal
    virtual 
    override
    {
        super._beforTokenTransfer(operator, from, to, ids, amounts, data);
    require(from == address(0), "SoulboundToken: token cannot be transferred!");

    }

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
     console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
    // it will be deleted after test
    return commentTokenId;
    
    }

}
