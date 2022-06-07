// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract TodoList
{
   struct Todo
   {
       string text;
       bool completed;
   }

   Todo[] public todos;

   function insert(string calldata _text) external
   {
        todos.push(Todo({
            text : _text,
            completed : false
        }));
   }
   
   function update(uint _index,string calldata _text) external
   {
       todos[_index].text = _text;

    //    Todo storage todo = todos[_index];
    //    todos.text = _text;
   }

   function get(uint _index) view external returns(string memory, bool)
   { 
       //we are using memory instad of storage for saving gas fee
       Todo memory todos = todos[_index];
       return (todos.text, todos.completed);
   }

   function changeStatus(uint _index) external
    {
        todos[_index].completed = !todos[_index].completed;
    }
}