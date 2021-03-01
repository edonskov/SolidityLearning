// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3/contracts/math/SafeMath.sol";

contract SimpleStorage {
    
    using SafeMath for uint256;
    
    uint256 value;

    function set(uint256 _x) public {
        value = _x;
    }
    
    function add(uint256 _x) public {
        value = value.add(_x);
    }
    
    function sub(uint256 _x) public {
        value = value.sub(_x);
    }
    
    function mul(uint256 _x) public {
        value = value.mul(_x);
    }
    
    function div(uint256 _x) public {
        value = value.div(_x);
    }

    function get() public view returns (uint256) {
        return value;
    }
}