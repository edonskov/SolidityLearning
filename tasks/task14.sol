// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/utils/Address.sol";


contract Task14 {
    
    using Address for address payable;
    
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
        if(!_receiver.isContract()) {
            _receiver.sendValue(value);
            balance -= value;
            emit Send(msg.sender, value);
        }
        else { 
            revert();
        }
    }    
    
    receive() external payable {
        balance += msg.value;
        emit Receive(msg.sender, msg.value);
    }
}