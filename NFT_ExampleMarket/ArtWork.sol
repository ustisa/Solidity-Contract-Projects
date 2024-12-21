// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ArtWork is ERC721("Georgi","GRG"){

    address public owner;

    constructor(){
        owner = msg.sender;
        
    }

    function selfMint(address _owner, uint256 _tokenId) public onlyOwner{
        _mint(_owner, _tokenId);
    }

    modifier onlyOwner{
        require(msg.sender == owner,"You are not the owner");
        _;
    }
}
