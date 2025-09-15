pragma solidity ^0.8;

// // 合约和用户之间的转账
// contract Day05Contruct {
//     // 加payable关键字表示外部账户，向合约账户转账或支付
//     function getMessageDetails() public payable returns(address,uint,bytes memory,bytes4){
//         return (msg.sender,msg.value,msg.data,msg.sig);
//     }
//     function viewMessageDetail() public view returns(bytes memory,bytes4){
//         return (msg.data,msg.sig);
//     }

//     // function transfer() public {

//     // }

//     //错误处理
//     //require 语句
//     //assert 语句,条件不满足，回滚所有状态更改
//     function divide(uint256 a,uint256 b) public pure returns(uint256,bool,bool,bool){
//         bool aStatus;
//         bool bStatus;
//         bool cStatus;
//         uint256 result = a / b;
//         aStatus = true;
//         bStatus = true;
//         cStatus = true;
//         if (b==0){
//             revert("Insufficient funds");
//         }
//         return (result,aStatus,bStatus,cStatus);
//     }
//     error NotOwner();
//     function onlyOwner(address owner) public view {
//         if (msg.sender!=owner){
//             revert NotOwner();
//         }
//         require(msg.sender==owner,"error");
//     }
//     //revert 语句


// }
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract EtherContract {
    //  constructor () ERC20("MyToken","MTK"){}
    // 向地址转账 （外部账户地址 向外部账户地址转账） 使用address payable
    function sendEther(address payable  recipient) public payable{
        recipient.transfer(msg.value);
    }
    //可以使用：外部地址向合约账户地址转账 && 外部地址向外部地址账户转账
    function sendToContract(address to) public payable{}
 
    //只能外部地址向合约账户地址转账，方式二
    // function  pay() public payable{}

    // 调用地址的代码（低级别调用）
function callContract(address addr, bytes memory  data) public returns (bool, bytes memory) {
    (bool success, bytes memory result) = addr.call(data);
    return (success, result);
}
function test(uint a,uint b) public pure returns(uint) {
    return a+b;
}
//外部账户向合约支付
function pay() public payable {}

//全局变量msg.sig函数选择器 和 msg.data交易调用时完整的数据
//0x034899bc
// 0x034899bc
function getSelector() public pure returns(bytes4){
    //获取当前函数的签名
    return msg.sig;
}
//0x9c0352c4
function getSeletor2() public pure returns(bytes4){
    //获取当前函数的签名
    return msg.sig;
}
// 4.计算函数选择器
function computeSelector(string memory func) public pure returns(bytes4){
    return bytes4(keccak256(bytes(func)));
}

// 获取交易调用的完整数据，包括函数体，参数信息
//0xa9059cbb0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc40000000000000000000000000000000000000000000000000000000000000001
function transfer(address add,uint256 amount) public pure  returns(bytes memory){
    return msg.data;
}
//0xa9059cbb0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc40000000000000000000000000000000000000000000000000000000000000001
function encodeFunctionCall() public pure returns(bytes memory){
    return abi.encodeWithSignature("transfer(address,uint256)",0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,1);
}
}