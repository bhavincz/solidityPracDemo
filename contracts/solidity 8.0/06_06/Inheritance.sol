// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract A
{
  
  function name() public pure virtual returns(string memory)
  {
      return "Bhavin";
  }

  function fname() public pure returns(string memory)
  {
      return "j.v lathiya";
  }


}

contract B is A
{
    function name() public pure override returns(string memory)
    {
      return "Anurag";
    }

}

contract C is B,A
{
    function name() public pure override returns(string memory)
    {
      return "Anurag";
    }

}

