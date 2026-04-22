// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {IToken, TokenAttacker} from "../src/attacks/Level05Token_Attack.sol";

contract TokenTest is Test {
    address player = address(0x1);

    function test_Attack() public {
        vm.startPrank(player);
        vm.deal(player, 1 ether);

        address tokenAddr = deployCode(
            "Level05Token.sol:Token",
            abi.encode(20)
        );
        IToken token = IToken(tokenAddr);
        TokenAttacker attacker = new TokenAttacker(address(token));

        console.log("player balance: ", token.balanceOf(player));
        console.log("attacker balance: ", token.balanceOf(address(attacker)));

        attacker.attack(player);

        console.log("player balance after attack: ", token.balanceOf(player));
        console.log(
            "attacker balance after attack: ",
            token.balanceOf(address(attacker))
        );

        vm.stopPrank();
    }
}
