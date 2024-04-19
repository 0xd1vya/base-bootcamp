// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract GarageManager {
    struct Car {
        string make;
        string model;
        string color;
        uint numberOfDoors;
    }

    mapping (address => Car[]) public garage;

    function addCar(string memory _make, string memory _model, string memory _color, uint _doors) public {
        Car memory car = Car(_make, _model, _color, _doors);
        garage[msg.sender].push(car);
    } 

    function getMyCars() public view returns (Car[] memory cars) {
        return getUserCars(msg.sender);
    }

    function getUserCars(address user) public view returns (Car[] memory cars) {
        return garage[user];
    }

    error BadCarIndex(uint carIdx);

    function updateCar(uint carIdx, string memory _make, string memory _model, string memory _color, uint8 _doors) public {
        if(garage[msg.sender].length < carIdx) {
            revert BadCarIndex(carIdx);
        }
        garage[msg.sender][carIdx] = Car(_make, _model, _color, _doors);
    }

    function resetMyGarage() public {
        delete garage[msg.sender];
    }
}