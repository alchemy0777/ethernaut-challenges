// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {Elevator} from "../src/levels/Level11Elevator.sol";
import {ElevatorAttack} from "../src/attacks/Level11Elevator_Attack.sol";

contract ElevatorTest is Test {
    address owner = address(0x0);
    address player = address(0x1);

    function test_Attack() public {
        vm.startPrank(owner);
        vm.deal(owner, 1 ether);

        Elevator elevator = new Elevator();

        vm.stopPrank();

        vm.startPrank(player);
        vm.deal(player, 1 ether);

        console.log("elevator top before attack: ", elevator.top());
        console.log("elevator floor before attack: ", elevator.floor());

        ElevatorAttack attacker = new ElevatorAttack(address(elevator));
        attacker.attack();

        console.log("elevator top after attack: ", elevator.top());
        console.log("elevator floor after attack: ", elevator.floor());

        vm.stopPrank();
    }
}
