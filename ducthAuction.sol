// SPDX-License-Identifier: MIT

pragma solidity ^0.8;


interface IERC721
{
    function transferfrom
    (   address _from,
        address _to,
        uint _nftId
    ) external;

}

contract dutchAuction
{
   uint private constant DURATION = 7;

   IERC721 public immutable nft;
   uint public immutable nftid;

   address payable public immutable seller;
   uint public immutable startingPrice;
   uint public immutable startAt;
   uint public immutable expireAt;
   uint public immutable discountRate;

   constructor(
       uint _startingPrice,
       uint _discountRate,
       address _nft,
       uint _nftId
   )
   {
            seller = payable(msg.sender);
            startingPrice = _startingPrice;
            discountRate = _discountRate;
            startAt = block.timestamp;
            expireAt = block.timestamp;
              
            require(_startingPrice >= _discountRate * DURATION, "starting price < discount");
          
            nft = IERC721(_nft);
            nftid = _nftId;
   }

   function getPrice() public view returns(uint)
   {
       uint timElapsed =  block.timestamp - startAt;
       uint discount = discountRate * timElapsed;
       return startingPrice - discount;
   }

   function buy() external payable 
   {
        require(block.timestamp < expireAt, "Auction allready ended..");

        uint nftPrice = getPrice();
        
        require(msg.value >= nftPrice, "price < nftPrice");

        nft.transferfrom(seller, msg.sender, nftid);

        uint refund = msg.value - nftPrice;

        if(refund > 0)
        {
            payable(msg.sender).transfer(refund);
        }
 
        selfdestruct(seller);
    
    }
}