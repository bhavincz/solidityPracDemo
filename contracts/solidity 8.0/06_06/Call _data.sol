// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract CallData
{
   
   string public str;


    //gas: 103344
    //input: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
   function set(string memory _str) external
   {
       str = _str;
   }

    //gas: 102783
    //input: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    // using calldata instance of mempry we can save gas
  function setCalldata(string calldata _str) external
   {
       str = _str;
   }

}