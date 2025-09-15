// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ArrayContract {
    //创建动态数组
    uint[] public arr1 = [1,2,3,4];
    // int[] public arr2 = [1,2,3,4]; 这会导致报错，无符号的uint类型无法转换成int类型
    uint256 public a =10;
    uint256[] public arr;
    uint256[] public arr2 = [1,2,3,4,5,6];
    uint256[] public arr3 = new uint256[](5);

    //创建静态数组
    uint256[3] public staticArr;
    //读取静态数组中元素
    uint256[3] public staticApi = [1,3,2];

    // external 参数可提供外部账户调用，本地账户调用一般不会使用，如果使用需要搭配this进行调用，比较少这样调用的
    function readArr() external view returns (uint256[3] memory data,uint256 len){
        data = staticArr;
        len = staticArr.length;
    }

}