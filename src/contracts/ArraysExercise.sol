// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address[] public senders;
    uint[] public timestamps;

    function getNumbers() public view returns (uint[] memory){
        return numbers;
    }

    function resetNumbers() public {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    function appendToNumbers(uint[] calldata _toAppend) public {
        for(uint index = 0; index < _toAppend.length; index++) {
            numbers.push(_toAppend[index]);
        }
    }

    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    function _countTimestamp() internal view returns(uint) {
        uint result = 0;
        for(uint i = 0; i < timestamps.length; i++) {
            if(timestamps[i] > 946702800) {
                result++;
            }
        }
        return result;
    }

    function afterY2K() external view returns(uint[] memory, address[] memory) {
        uint count = _countTimestamp();
        uint[] memory resultTimestamps = new uint[](count);
        address[] memory resultSenders = new address[](count);
        uint cursor = 0;
        for(uint i = 0; i < timestamps.length; i++) {
            if(timestamps[i] > 946702800) {
                resultTimestamps[cursor] = timestamps[i];
                resultSenders[cursor] = senders[i];
                cursor++;
            }
        }
        return (resultTimestamps, resultSenders);
    }

    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps;
    }
 }