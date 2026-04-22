// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Telephone, TelephoneAttacker} from "../src/Level04Telephone.sol";

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
