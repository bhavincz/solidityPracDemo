//SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Mapping
{
    mapping(address => uint) public balance;
    mapping(address => bool) public inserted;
    address[] public keys; 

    function set(address _key, uint _value) external
    {
        balance[_key] = _value;

        if(!inserted[_key])
        {
            inserted[_key] = true;
            keys.push(_key);    
        }
    }

    function getSize() external view returns (uint)
    {
        return keys.length;
    } 
}

