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

    //定义授权结构体
    struct ApprovalMsg {
        address spender;
        uint256 value;
    }
    mapping (address=> uint256 balance) public balancesAmount;
    mapping (address=> ApprovalMsg[]) public userApprovals; //存储每次的授权结果
    mapping(address => mapping(address => uint)) public approvalIndex; //查找已经授权的信息，找到特定spender的授权信息索引
    //Approval 事件
    event ApprovalEvent(address  _owner, address  _spender, uint256 _value);
     //Transfer 事件
    event TransferEvent(address  _from, address  _to, uint256 _value);
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
    function setBalances() external {
        balancesAmount[msg.sender] = balanceOf(msg.sender);
    }
    // 查看账户余额
    function getBalances() external view returns(uint256){
         return balancesAmount[msg.sender];
    }
    function transferMTK(address to,uint256 value) public returns(bool){
        //发起转账交易
        require(value>0,"token can not be less 0!");
        transfer(to, value);
        emit TransferEvent(msg.sender,to,value);
        return true;

    }
    //approve 允许 _spender 从您的账户，被授权的代币总限额数量为 _value
    function approveMTK(address _spender, uint256 _value) external  returns(bool) {
        require(_spender !=address(0),"spender account is err!");
        require(_value>0,"token can not be less 0!");
        //调用父合约ERC20的限额授权approve方法
        approve(_spender, _value);
        
        //检查是否已经存在对该spender的授权
        uint index = approvalIndex[msg.sender][_spender];
        if (index>0){
            // 已有授权，更新授权限额信息
            userApprovals[msg.sender][index-1].value = _value;
        }else{
            //创建新授权
            userApprovals[msg.sender].push(ApprovalMsg(_spender,_value));
            //更新索引映射
            approvalIndex[msg.sender][_spender] = userApprovals[msg.sender].length;
        }
        emit ApprovalEvent(msg.sender,_spender,_value);
        return true;
    }
    //transferFrom 允许 _from 从您的账户多次提款，被授权的代币数量为 _value，可以一笔一笔转账直到达到（approve）总共转账限额为止
    function transferFromMTK(address from, address to, uint256 value) external returns(bool){
        require(value>0,"token can not be less 0!");
        transferFrom(from, to, value);
        emit TransferEvent(from, to, value);
        return true;

    }
    //获取特定的spender授权信息
    function getApproveMTKForSpender(address _spender) external view  returns (uint256 value){
        uint256 index = approvalIndex[msg.sender][_spender];
        ApprovalMsg memory approvalObj = userApprovals[msg.sender][index-1];
        return approvalObj.value;
    }
    //6.提供mint函数，允许合约发所有者增发代币
    function mint(address account,uint256 tokenAmount) external onlyOwner {

        require(tokenAmount>0,"token can not be less 0!");
        _mint(msg.sender, tokenAmount);
    }
}
