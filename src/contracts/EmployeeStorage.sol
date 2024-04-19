// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract EmployeeStorage {
    uint16 private shares;
    uint32 private salary;
    uint256 public idNumber;
    string public name;

    constructor() {
        shares = 1000;
        salary = 50000;
        idNumber = 112358132134;
        name = "Pat";
    }

    function viewSalary() public view returns (uint32 _salary){
        return salary;
    }

    function viewShares() public view returns (uint16 _shares){
        return shares;
    }

    error TooManyShares(uint _totalShares);

    function grantShares(uint16 _newShares) public {

        if(_newShares > 5000) {
            revert("Too many shares");
        } else if (shares + _newShares > 5000) {
            revert TooManyShares(shares + _newShares);
        } else {
            shares += _newShares;
        }
    }

    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload (_slot)
        }
    }

    /**
    * Warning: Anyone can use this function at any time!
    */
    function debugResetShares() public {
        shares = 1000;
    }
}