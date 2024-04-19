// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract FavoriteRecords {
    mapping (string => bool) approvedRecords;
    mapping (address => mapping (string => bool)) userFavorites;
    mapping (address => string[]) userFavList;
    string[] public allRecords;

    constructor() {
        allRecords = [
            "Thriller",
            "Back in Black",
            "The Bodyguard",
            "The Dark Side of the Moon",
            "Their Greatest Hits (1971-1975)",
            "Hotel California",
            "Come On Over",
            "Rumours",
            "Saturday Night Fever"
        ];

        for(uint i; i < allRecords.length; i++) {
            approvedRecords[allRecords[i]] = false;
        }
    }

    // returns all approved records
    function getApprovedRecords() public view returns (string[] memory) {
        return allRecords;
    }

    error NotApproved(string albumName);

    function addRecord(string memory albumName) public {
        bytes memory albumNameBytes = bytes(albumName);

        for(uint i; i < allRecords.length; i++) {
            bytes memory recordBytes = bytes(allRecords[i]);
            if (keccak256(albumNameBytes) == keccak256(recordBytes)) {
                approvedRecords[albumName] = true;
                if (userFavorites[msg.sender][albumName] == false) {
                    userFavList[msg.sender].push(albumName);
                }
                userFavorites[msg.sender][albumName] = true;
                return;
            }
        }
        revert NotApproved(albumName);
    }

    // returns request sender's favorites
    function getUserFavorites(address user) public view returns(string[] memory) {
        return userFavList[user];
    }

    // resets the user favorites
    function resetUserFavorites() public {
        string[] storage userFav = userFavList[msg.sender];
        for (uint i = 0; i < userFav.length; i++) {
            delete userFavorites[msg.sender][userFav[i]];
        }
        delete userFavList[msg.sender];
    }
}