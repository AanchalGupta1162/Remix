// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "SimpleStorge.sol";

contract StorageFactory {
    SimpleStorage [] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    } 

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //  Address
        // ABI (technically a lie, you just need the function selector)
        // Application Binary Interface
        SimpleStorage mySimpleStorage = SimpleStorage(listOfSimpleStorageContracts[_simpleStorageIndex]);
        mySimpleStorage.store(_newSimpleStorageNumber);

    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}