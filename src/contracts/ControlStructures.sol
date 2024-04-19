// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ControlStructures {
    function fizzBuzz(uint _number) public pure returns (string memory) {
        string memory result = "";

        if (_number % 3 != 0 && _number % 5 != 0) {
            result = string.concat(result, "Splat");
        } else {
            if (_number % 3 == 0) {
                result = string.concat(result, "Fizz");
            }

            if (_number % 5 == 0) {
                result = string.concat(result, "Buzz");
            }
        }
        return result;
    }

    error AfterHours(uint _time);

    function doNotDisturb(uint _time) public pure returns (string memory) {
        assert(_time <= 2400);
        
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        } else if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        } else if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        } else if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }
        revert AfterHours(_time);
    }         
}