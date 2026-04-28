// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {ElevatorAttack} from "../src/attacks/Level11Elevator_Attack.sol";

contract ElevatorScript is Script {
    function setUp() public {}

    function run() public {
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");

        vm.startBroadcast();

        ElevatorAttack attacker = new ElevatorAttack(instanceAddress);
        attacker.attack();

        vm.stopBroadcast();
    }
}
