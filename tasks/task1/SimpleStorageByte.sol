pragma solidity >=0.7.0 <0.8.0;

contract SimpleStorage {
    
    bytes32 storedData;

    function set(bytes32 _x) public {
        storedData = _x;
    }

    function get() public view returns (bytes32) {
        return storedData;
    }
}