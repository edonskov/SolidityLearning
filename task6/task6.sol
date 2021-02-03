// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;

#interafaces
interface B {
    function setData(uint a) external;
    function getData() external view returns(uint);
    function computePlus(uint a, uint b) external returns (uint);
}

#inheritance from interfaces
contract C is B{
    uint private data;

    function setData(uint a) public override  { data = a; }
    function getData() public view override returns (uint)   { return data; }
    function computePlus(uint a, uint b) external pure override returns (uint) { return a + b; }
    function computeMinus(uint a, uint b) internal pure returns (uint) { return a - b; }
}

#related contract with IS
contract D is C {
    address private owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function decrease(uint a) public onlyOwner returns(uint) {
        uint val = computeMinus(a, 1); // access to internal member (from derived to parent contract)
        return val;
    }
}

#related contract with modifiers
contract E {
    D d;
    
    constructor() public {
        d = new D();
    }
    
    function decreaseProxy(uint a) public returns(uint) {
        return d.decrease(a);
    }
    
}