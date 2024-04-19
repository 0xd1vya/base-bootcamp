// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "forge-std/Script.sol";
import "../src/contracts/Inheritance.sol";

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();

        Salesperson salesperson = new Salesperson(55555, 12345, 20);
        EngineeringManager engineeringManager = new EngineeringManager(54321, 11111, 200000);
        // inheritance submission contract
        new InheritanceSubmission(address(salesperson), address(engineeringManager));

        vm.stopBroadcast();
    }
}