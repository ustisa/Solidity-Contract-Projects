// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Tether is ERC20("Tether", "USDT"){

    constructor(){
        _mint(msg.sender, 10000);
    }
}
