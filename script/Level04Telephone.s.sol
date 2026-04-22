// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Telephone, TelephoneAttacker} from "../src/Level04Telephone.sol";

contract TelephoneScript is Script {
    Telephone public telephone;

    function setUp() public {}

    function run() public {
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");

        vm.startBroadcast();

        TelephoneAttacker attacker = new TelephoneAttacker(instanceAddress);
        attacker.attack();

        vm.stopBroadcast();
    }
}
