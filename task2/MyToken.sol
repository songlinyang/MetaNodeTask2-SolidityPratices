// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract Ownable {
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    //定义修饰
    modifier onlyOwner(){
        require(msg.sender==owner,"Only owner can call this function");
        _;
    }
}


contract MyToken is ERC20, ERC20Permit,Ownable {
    
    mapping (address=> uint256 balance) public balancesAmount;
    mapping (address=> uint256 approveAmount) public approveMsg;
    //Approval 事件
    event ApprovalEvent(address indexed _owner, address indexed _spender, uint256 _value);
     //Transfer 事件
    event TransferEvent(address indexed _from, address indexed _to, uint256 _value);
    // receiver 事件
    event receiverEvent(address sender,uint amount);
    // fallback 事件
    event  fallbackEvent(address sender,uint amount,bytes data);
    constructor () ERC20("MyToken","MTK") ERC20Permit("MyToken"){}

    // 允许转账
    receive() external payable { 
        emit receiverEvent(msg.sender,msg.value);
    }
    // 进行兜底处理
    fallback() external payable { 
        emit fallbackEvent(msg.sender, msg.value, msg.data);
    }
    // 查看账户余额
    function getBalances(address account) external returns(uint256){
        balancesAmount[account] = balanceOf(account);
        return balancesAmount[account];
    }
    function transfer(address to,uint256 value) public override returns(bool){
        //发起转账交易
        require(value>0,"token can not be less 0!");
        emit TransferEvent(msg.sender,to,value);
        return true;

    }
    //approve 允许 _spender 从您的账户多次提款，最高金额为 _value
    function approve(address _spender, uint256 _value) public override onlyOwner returns(bool) {
        require(_spender !=address(0),"spender account is err!");
        require(_value>0,"token can not be less 0!");
        approveMsg[_spender] = _value;
        emit ApprovalEvent(msg.sender,_spender,_value);
        return true;
    }
    //6.提供mint函数，允许合约发所有者增发代币
    function mint(address account,uint256 tokenCount) external onlyOwner {
        require(tokenCount>0,"token can not be less 0!");
        _mint(msg.sender, tokenCount*10**decimals());
    }
}
