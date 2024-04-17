//SPDX-Liscense-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract WriteComment is ERC721Enumerable {
    constructor() ERC721("comment","COM") {}
    function writeYourComment() public {
        uint256 commentTokenId = totalSupply() + 1;
    }
    
}
