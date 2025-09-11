// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MergeArray{
    function mergeArrayView(uint[] memory array1,uint[] memory array2) public pure returns ( uint[] memory) {
        uint length1 = array1.length;
        uint length2 = array2.length;
        uint[] memory array = new uint[](length1+length2);
        for (uint i = 0; i < length1; i++)
        {
            array[i] = array1[i];
        }
        for (uint j = 0; j < length2; j++) {
            array[length1+j] = array2[j];
        }
        return mergeEqualNum(array);
    }
    function mergeEqualNum(uint[] memory array) public pure returns (uint[] memory){
        if(array.length==0){
            return array;
        }
        uint[] memory newArray = new uint[](array.length - 1);
        for(uint i=0;i<newArray.length;i++){
            for(uint j=i+1;j<newArray.length;j++){
                if(array[i]==array[j]){
                    for(uint k=j;k<newArray.length;k++){
                        array[k]=array[k+1];
                    }
                }
            }
        }
        for(uint i=0;i<newArray.length;i++){
            newArray[i] = array[i];
        }

        return newArray;
    }
}