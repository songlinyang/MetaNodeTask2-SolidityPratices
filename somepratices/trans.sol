// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

//转账
// 一、合约转给外部账户

contract Bank{

    event Calllog(bytes  input,bytes  output);

    receive() external payable { } 
    // 方式一：合约账户转给外部账户
    function withdrawWithTransfer() external returns(address){
        payable(msg.sender).transfer(1 ether);
        return msg.sender;
    }

    //方式二： 合约账户转给外部账户
    function withdrawWithSend() external returns(address,bool) {
        bool success = payable(msg.sender).send(1 ether);
        return (msg.sender,success);
    } 
    // 方式三： 合约账户转给外部账户
    function withdrawWithCall(bytes memory input ) external returns (address,bool,bytes memory) {
        (bool success,bytes memory data) = payable(msg.sender).call{value:1 ether}(input);
        require(success,"call failed");
        emit Calllog(input, data);
        return (msg.sender,success,data);
    }
}
//0xEAE7277665f44410004F41D8a6d589a28D4b609A
// 合约转合约
contract BankUser{
    Bank bank;
    constructor(address payable _bank) {
         bank = Bank(_bank);
    }
    //为什么报错：transact to Bank.withdrawWithCall errored: Error occurred: revert.
    //因为少了receive方法,可以接受ETH 
    receive() external payable {}
    function withdrawWithTransfer() external returns (address){
        return bank.withdrawWithTransfer();
    }
    function withdrawWithSend() external  returns (address,bool){
        return bank.withdrawWithSend();
        
    }
    function withdrawWithCall(bytes memory input) external returns(address a,bool b,bytes memory c){
        (a,b,c) = bank.withdrawWithCall(abi.encodePacked(input));
    }

    function testPay() external payable returns(address) {
        return  0x2DD66f8FE4fC5f01A03202B29d69c106Df6f1e4B;
    }

}
