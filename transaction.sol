//SPDX License-Identifier: MIT

pragma solidity ^0.8.19;

   contract transaction {
       uint storedData;
   }

   contract SimpleStorage {
       uint storedData;
   
       function set(uint x) public {
           storedData = x;
       }
   
       function get() public view returns (uint) {
           return storedData;
       }
   }

