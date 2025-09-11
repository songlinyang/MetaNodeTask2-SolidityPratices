// SPDX-License-Identifier: MIT
// 反转字符串
pragma solidity ^0.8;

contract ReverseContract{
    function reverse(string calldata str) external  pure returns  (string memory,uint){
        bytes memory stringArr;
        stringArr =  bytes(str);
        for (uint i = 0; i < stringArr.length/2; i++) {
            bytes1 temp = stringArr[i];
            stringArr[i] = stringArr[stringArr.length - 1 - i];
            stringArr[stringArr.length - 1 - i] = temp;
        }
        return (string(stringArr),stringArr.length);
    }
}