// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract SendEther
{
  
  constructor() payable {}

  receive() external payable {}

  function sendViaTransfer(address payable _to) external payable{
        _to.transfer(123);
  }

  function sendViaSend(address payable _to) external payable{
        bool success =  _to.send(123);
        require(success, "Failed");
  } 

  function sendViaCall(address payable _to) external payable{
        (bool success, ) =  _to.call{value: 123}(" ");
        require(success, "Failed");
  }
}

contract RecieveEther
{
    event Log(uint amnt, uint gas);

    receive() external payable
    {
        emit Log(msg.value, gasleft());
    }
}
