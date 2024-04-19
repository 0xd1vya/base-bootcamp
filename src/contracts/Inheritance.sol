// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

abstract contract employee {
    uint public idNumber;
    uint public managerId;

    constructor(uint id, uint mid) {
        idNumber = id;
        managerId = mid;
    }

    function getAnnualCost() public virtual view returns (uint);
}

contract Salaried is employee{
    uint public annualSalary;

    constructor(uint id, uint mid, uint salary) employee(id, mid){
        annualSalary = salary;
    }

    function getAnnualCost() public override view returns (uint) {
        return annualSalary;
    }
}

contract Hourly is employee {
    uint public hourlyRate;

    constructor(uint id, uint mid, uint hourly) employee(id, mid) {
        hourlyRate = hourly;
    }

    function getAnnualCost() public override view returns (uint) {
        return hourlyRate * 2080;
    }
}

contract Salesperson is Hourly {
    constructor(uint id, uint mid, uint hourly) Hourly(id, mid, hourly) {
        
    }
}

contract Manager {
    uint[] public ids;

    function addReport(uint id) public {
        ids.push(id);
    }

    function resetReports() public {
        delete ids;
    }
}

contract EngineeringManager is Manager, Salaried {
    constructor(uint id, uint mid, uint salary) Salaried(id, mid, salary) {
        
    }
}

contract InheritanceSubmission {
    address public salesPerson;
    address public engineeringManager;

    constructor(address _salesPerson, address _engineeringManager) {
        salesPerson = _salesPerson;
        engineeringManager = _engineeringManager;
    }
}