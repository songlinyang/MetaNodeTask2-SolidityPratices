// SPDX-License-Identifier: MIT
//罗马字符转数字
pragma solidity ^0.8.0;

contract RomanToInteger {
    struct RomanStruct {
        string romanSymbol;
        uint alNumber;
    }
    RomanStruct[] public romanArray;
    
    // 映射用于快速查找罗马符号对应的值
    mapping(bytes1 => uint) private romanValueMap;
    
    function setValue(string memory key, uint value) public {
        romanArray.push(RomanStruct(key, value));
        
        // 同时更新映射
        bytes memory keyBytes = bytes(key);
        if (keyBytes.length == 1) {
            romanValueMap[keyBytes[0]] = value;
        }
    }

    function viewArray(uint index) public view returns (RomanStruct memory) {
        require(index < romanArray.length, "out of romanArray index range!");
        return romanArray[index];
    }
    
    constructor() {
        setValue("M", 1000);
        setValue("CM", 900);
        setValue("D", 500);
        setValue("CD", 400);
        setValue("C", 100);
        setValue("XC", 90);
        setValue("L", 50);
        setValue("XL", 40);
        setValue("X", 10);
        setValue("IX", 9);
        setValue("V", 5);
        setValue("IV", 4);
        setValue("I", 1);
    }

    // 罗马数字转整数函数
    function romanToInt(string memory romanStr) public view returns (uint) {
        bytes memory romanBytes = bytes(romanStr);
        uint total = 0;
        uint prevValue = 0;
        
        // 从右向左处理罗马数字
        for (uint i = romanBytes.length; i > 0; i--) {
            bytes1 currentChar = romanBytes[i - 1];
            uint currentValue = romanValueMap[currentChar];
            
            // 如果当前字符不在映射中，抛出错误
            if (currentValue == 0) {
                revert("Invalid Roman numeral character");
            }
            
            // 根据罗马数字规则：如果当前值小于前一个值，则减去当前值
            // 否则加上当前值
            if (currentValue < prevValue) {
                total -= currentValue;
            } else {
                total += currentValue;
            }
            
            prevValue = currentValue;
        }
        
        return total;
    }
}