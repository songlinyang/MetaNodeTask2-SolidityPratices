// SPDX-License-Identifier: MIT
// 二分查找
pragma solidity ^0.8.0;

contract BinaryContract {
    int[] public inputArray;
    
    function initArray(int[] memory arr) public {
        inputArray = arr;
    }
    
    function checkBinSearch(int target) public view returns (string memory) {
        require(inputArray.length > 0, "Array is empty");
        if (binSearch(target)) {
            return "True";
        } else {
            return "False";
        }
    }
    
    function binSearch(int target) public view returns (bool) {
        uint left = 0;
        uint right = inputArray.length - 1;
        
        while (left <= right) {
            uint mid = left + (right - left) / 2;
            
            if (inputArray[mid] == target) {
                return true;
            } else if (inputArray[mid] < target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        
        return false;
    }
}