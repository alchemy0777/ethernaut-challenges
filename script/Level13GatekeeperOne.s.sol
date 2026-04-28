// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {
    GatekeeperOneAttack
} from "../src/attacks/Level13GatekeeperOne_Attack.sol";

contract GatekeeperOneScript is Script {
    function setUp() public {}

    function run() public {
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");

        vm.startBroadcast();

        GatekeeperOneAttack gatekeeperOneAttack = new GatekeeperOneAttack(
            instanceAddress
        );

        gatekeeperOneAttack.attack();

        vm.stopBroadcast();
    }
}
