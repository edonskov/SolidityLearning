pragma solidity >=0.7.0 <0.8.0;

contract SimpleStorage {
    
    string storedData;

    function set(string memory _x) public {
        storedData = _x;
    }

    function get() public view returns (string memory) {
        return storedData;
    }
}