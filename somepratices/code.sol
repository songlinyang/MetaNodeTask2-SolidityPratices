// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
 
 contract MyContract {
    event Received(address sender, uint amount);
    
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    function getSig(address addr) external  pure returns(bytes4){
       if (addr!=0x5F712f4B5f319627422C2e435e2CDC74c002B845) {
        revert();
       }  
       return msg.sig;
    }
    event FallbackCalled(address sender, uint amount, bytes data);
    
    //兜底操作
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }
    
}
//0xb88a170b000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000063132333435360000000000000000000000000000000000000000000000000000
//0xb88a170b000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000063132333435360000000000000000000000000000000000000000000000000000
// 函数选择器 也不需要修饰符，只需要数据类型即可
contract GetSig {
    function getSig(string memory str) external pure returns(bytes4) {
        return msg.sig;
    }

    function getencodeDataFunction() external pure returns(bytes memory) {
        return abi.encodeWithSignature("getSig(string)", "123456");
    }
}

