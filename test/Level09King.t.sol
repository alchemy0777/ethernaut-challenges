// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {King} from "../src/levels/Level09King.sol";
import {KingAttack} from "../src/attacks/Level09King_Attack.sol";

contract KingTest is Test {
    address owner = address(0x0);
    address player = address(0x1);

    function test_Attack() public {
        vm.startPrank(owner);
        vm.deal(owner, 1 ether);

        King king = new King{value: 1000000 gwei}();
        address targetAddr = address(king);

        vm.stopPrank();

        vm.startPrank(player);
        vm.deal(player, 1 ether);

        console.log("owner: ", king.owner());
        console.log("king: ", king._king());
        console.log("prize: ", king.prize());

        KingAttack attacker = new KingAttack(targetAddr);
        attacker.attack{value: 1000000 gwei}();

        console.log("----------------------");

        console.log("owner: ", king.owner());
        console.log("king: ", king._king());
        console.log("prize: ", king.prize());

        vm.stopPrank();

        // When you submit the instance back to the level, the level is going to reclaim kingship.
        vm.startPrank(owner);
        vm.deal(owner, 1 ether);
        (bool success, ) = address(king).call{value: 1000000 gwei}("");
        require(success, "call failed");
        vm.stopPrank();

        console.log("----------------------");
        console.log("owner: ", king.owner());
        console.log("king: ", king._king());
        console.log("prize: ", king.prize());
    }
}
