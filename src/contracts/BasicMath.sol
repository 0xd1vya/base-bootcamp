// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract BasicMath {

    function adder(uint _a, uint _b) public pure returns (uint sum, bool error) {
        if (_a > type(uint).max - _b) {
            return (0, true);
        } else {
            return (_a + _b, false);
        }
    }

    function subtractor(uint _a, uint _b) public pure returns (uint difference, bool error) {
        if (_a < type(uint).min + _b) {
            return (0, true);
        } else {
            return (_a - _b, false);
        }
    }
}