pragma solidity >=0.7.0 <0.8.0;

contract SimpleStorage {
    
    uint8 value;

    function set(uint8 _x) public {
        value = _x;
    }
    
    function add(uint8 _x) public {
        value = value + _x;
    }

    function get() public view returns (uint8) {
        return value;
    }
}