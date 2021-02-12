// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;
pragma experimental ABIEncoderV2;

contract Task09 {

    struct User {
        uint number;
        uint balance;
    }

    User[] private users;

    event ChangeStruct(
        address indexed sender,
        uint indexed number,
        uint balance
    );
    
    function addUser(uint number, uint balance) external {
        users.push(User(number, balance));
        emit ChangeStruct(msg.sender, number, balance);
    }
    
    function getAll() external view returns(User[] memory) { 
        return users;
    }
    
    function removeLast() external { 
        users.pop();
    }

    function removeIndex(uint index) external {
        if (index < users.length) {
            for (uint i = index; i<users.length-1; i++){
                users[i] = users[i+1];
            }
            users.pop();
        }
    }
    
    function updateUser(uint number, uint balance) external {
        for (uint i = 0; i<users.length-1; i++){
            if (users[i].number == number) {
                users[i].balance = balance;
            }
        }
    }

}