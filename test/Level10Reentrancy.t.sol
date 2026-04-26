// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {ReentrancyAttack} from "../src/attacks/Level10Reentrancy_Attack.sol";

contract ReentrancyTest is Test {
    address owner = address(0x0);
    address player = address(0x1);

    function test_Attack() public {
        vm.startPrank(owner);
        vm.deal(owner, 1 ether);

        address targetAddr = deployCode(
            "Level10Reentrancy.sol:Reentrance",
            abi.encode()
        );

        vm.deal(targetAddr, 1000000 gwei);

        vm.stopPrank();

        vm.startPrank(player);
        vm.deal(player, 1 ether);

        console.log(
            "before attack balance of reentrancy: ",
            address(targetAddr).balance
        );

        ReentrancyAttack attacker = new ReentrancyAttack(targetAddr);
        attacker.attack{value: 100000 gwei}();

        console.log(
            "after attack balance of reentrancy: ",
            address(targetAddr).balance
        );

        vm.stopPrank();
    }
}
