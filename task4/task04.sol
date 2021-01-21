// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;
pragma experimental ABIEncoderV2;

contract Task04 {

    string[] dataArray;

    function addElement(string memory valueA) external{
        dataArray.push(valueA);
    }
    
   function getAll() external view returns(string[] memory) { 
        return dataArray;
    }

    function removeLast() external { 
        dataArray.pop();
    }

    function removeIndex(uint index) external{
        if (index < dataArray.length) {
            for (uint i = index; i<dataArray.length-1; i++){
                dataArray[i] = dataArray[i+1];
            }
            dataArray.pop();
        }
    }
}