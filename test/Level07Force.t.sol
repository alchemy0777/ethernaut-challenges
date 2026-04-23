// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {ForceAttack} from "../src/attacks/Level07Force_Attack.sol";

contract ForceTest is Test {
    address owner = address(0x0);
    address player = address(0x1);

    function test_Attack() public {
        vm.startPrank(owner);
        vm.deal(owner, 1 ether);

        address targetAddr = deployCode("Level07Force.sol:Force", abi.encode());

        vm.stopPrank();

        vm.startPrank(player);
        vm.deal(player, 1 ether);

        // check initial balance of targetAddr
        console.log("targetAddr balance: ", address(targetAddr).balance);

        ForceAttack attacker = new ForceAttack(targetAddr);
        attacker.attack{value: 1}();

        // check balance of targetAddr
        console.log("targetAddr balance: ", address(targetAddr).balance);

        vm.stopPrank();
    }
}
