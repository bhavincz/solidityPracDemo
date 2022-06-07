// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract EtherWallet
{
   address payable public owner;

   constructor()
   {
       owner = payable(msg.sender);
   }

   receive() external payable {}

   function withdraw(uint _amnt) external 
   {
        require(msg.sender == owner,"Owner can withdraw");
        payable(msg.sender).transfer(_amnt);
   }

   function getBalance() external view returns(uint)
   {
       return address(this).balance;
   }

}
