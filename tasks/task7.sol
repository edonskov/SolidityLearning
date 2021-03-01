// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;


contract Task07 {
    address private owner;
    uint public balance = 0;
    
    event Receive(
        address indexed _from,
        uint value
    );
    
    event Send(
        address indexed _from,
        uint value
    );
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function sendByOwner(address payable _receiver, uint value) public onlyOwner {
        _receiver.transfer(value);
        balance -= value;
        emit Send(msg.sender, value);
    }    
    
    function sendByUser(address payable _receiver, uint value) public {
        _receiver.send(value);
        balance -= value;
        emit Send(msg.sender, value);

    }
    
    receive() external payable {
        balance += msg.value;
        emit Receive(msg.sender, msg.value);
    }
}