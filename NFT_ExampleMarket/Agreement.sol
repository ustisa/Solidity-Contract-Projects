// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./ArtWork.sol";
import "./Tether.sol";

contract Agreement is ArtWork{

    // myTether is an instance of Tether or myTether is a state variable with Tether data-type
    Tether myTether; 

    constructor(Tether _myTether){
        myTether = Tether(_myTether);
    }

    mapping(address customer => uint256 tetherAmount) customerBalance;

    function tetherTransfer(address _customer, uint256 _tetherAmount) public{
        myTether.transferFrom(_customer, address(this), _tetherAmount);
        customerBalance[_customer] +=_tetherAmount;
    }

    function tetherBalance(address _customer) public view returns (uint256){
        return customerBalance[_customer];
    }

    function buyArtWork(address _customer, uint256 _tokenId) public{
        require(customerBalance[_customer] > 0,"Insuficient balance");
        require(ownerOf(_tokenId) == msg.sender,"You are not the owner of this token ID");
        _transfer(msg.sender, _customer, _tokenId);
        customerBalance[_customer] --;
    }
}
