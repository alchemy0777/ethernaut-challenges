// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {
    GatekeeperOneAttack
} from "../src/attacks/Level13GatekeeperOne_Attack.sol";
import {GatekeeperOne} from "../src/levels/Level13GatekeeperOne.sol";

contract GatekeeperOneTest is Test {
    address owner = address(0x0);
    address player = vm.envAddress("MY_ADDRESS");

    function test_Attack() public {
        vm.startPrank(owner);
        vm.deal(owner, 1 ether);

        GatekeeperOne gatekeeperOne = new GatekeeperOne();

        vm.stopPrank();

        vm.startPrank(player);
        vm.deal(player, 1 ether);

        GatekeeperOneAttack gatekeeperOneAttack = new GatekeeperOneAttack(
            address(gatekeeperOne)
        );

        gatekeeperOneAttack.attack();

        vm.stopPrank();
    }
}
