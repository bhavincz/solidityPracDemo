//SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Struct
{
    struct Car
    {
        string model;
        uint year;
        address owner;
    } 

    Car public car;
    Car[] public cars;
    mapping (address => Car[]) public cardByOwner;

    function Structure() external {
        Car memory Toyoto = Car("Toyoto",1991,msg.sender);
        Car memory lambo = Car({model:"Lambo",year:1992,owner:msg.sender});
        Car memory tesla;
        tesla.model  = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(Toyoto);
        cars.push(lambo);    
        cars.push(tesla);   

         cars.push(Car("Ferrari",1992,msg.sender));

         Car storage _car = cars[0];
         _car.year = 2000;

         delete cars[1].model;

    }
    
}

