// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract Event
{
  event message(address indexed _from,address indexed  _to,string message);

  function sendMessage(address _to,string calldata _message) public
  {
      emit  message(msg.sender,_to, _message );
  }

}