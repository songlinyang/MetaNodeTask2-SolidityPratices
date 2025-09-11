// SPDX-License-Identifier: MIT
//数字转罗马字符
pragma solidity ^0.8;

contract RomanContract {
    struct RomanStruct {
        string romanSymbol;
        uint alNumber;
    }
    RomanStruct[] public  romanArray;
    
    function setValue(string memory key,uint value) public{
        romanArray.push(RomanStruct(key,value));
    }

    function viewArray(uint index) public view  returns (RomanStruct memory){
        require(index<romanArray.length,"out of romanArray index range!");
        return romanArray[index];
    }
    constructor() {
        setValue("M",1000);
        setValue("CM",900);
        setValue("D",500);
        setValue("CD",400);
        setValue("C",100);
        setValue("XC",90);
        setValue("L",50);
        setValue("XL",40);
        setValue("X",10);
        setValue("IX",9);
        setValue("V",5);
        setValue("IV",4);
        setValue("I",1);
    }

    function initToRoman(uint num) public view returns (string memory) {
        bytes memory romanBytes;
        for(uint i=0;i<romanArray.length;i++){
            while (num>=romanArray[i].alNumber) {
                num -= romanArray[i].alNumber;
                // 将字符串转换为字节并追加到 romanBytes
                bytes memory symbolBytes = bytes(romanArray[i].romanSymbol);
                for (uint j = 0; j < symbolBytes.length; j++) {
                    // 动态扩展字节数组
                    bytes memory temp = new bytes(romanBytes.length + 1);
                    for (uint k = 0; k < romanBytes.length; k++) {
                        temp[k] = romanBytes[k];
                    }
                    temp[romanBytes.length] = symbolBytes[j];
                    romanBytes = temp;
                }
                if (num == 0) {
                    break;
                }
            }
            if (num == 0) {
                break;
            }

        }
        return string(romanBytes);
    }
}