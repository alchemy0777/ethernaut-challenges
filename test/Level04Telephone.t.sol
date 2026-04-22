// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Telephone} from "../src/levels/Level04Telephone.sol";
import {TelephoneAttacker} from "../src/attacks/Level04Telephone_Attack.sol";

contract TelephoneTest is Test {
    address player = address(0x1);

    function test_Attack() public {
        vm.startPrank(player);
        vm.deal(player, 1 ether);

        Telephone telephone = new Telephone();
        TelephoneAttacker attacker = new TelephoneAttacker(address(telephone));

        attacker.attack();
        assertEq(telephone.owner(), player);

        vm.stopPrank();
    }
}
