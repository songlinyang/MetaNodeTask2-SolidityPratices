// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8;

// // contract BlockInfo{
// //     function getBlockInfo() public view returns (uint blockNum ,uint blockTimeStamp ,address payable blockCoinbase ,uint blockDifficulty,uint blockGas, uint blockBasefee) {
// //         blockNum = block.number; // 当前区块编号 高度
// //         blockTimeStamp = block.timestamp; //当前区块的时间戳 （unix 时间）
// //         blockCoinbase = block.coinbase; //当前矿工出块地址
// //         blockDifficulty = block.difficulty; //当前区块难度
// //         blockGas = block.gaslimit;
// //         blockBasefee = block.basefee;
// //     }
// // }

// // contract TransactionInfo{
// //     function getTxInfo() public view returns (uint,address) {
// //         return (tx.gasprice,msg.sender);
// //     }
// // }

// // 不能使用tx.origin容易有漏洞 待回看视频
// // contract TxInfo { function getTxOrigin() public view returns (address) { return tx.origin; } }
// // contract TxChildInfo() {
// //     TxInfo ti;
// //     ti.constructor(){

// //     }
// // }

// // contract MessageInfo {
// //     function getMessageDetails() public view  returns (address, uint) {
// //         return (msg.sender, msg.value);
// //     }
// // }
// // 以太坊环境信息（Ethereum Environment Information）
// // contract ContractInfo {
// //     function getContractDetails() public view returns (address, uint) {
// //         return (address(this), address(this).balance);
// //     }
// //     function getLeft111() public view returns (uint){
// //         return block.chainid; //当前链的ID EIP-1344
// //     }
// // }


// // contract ThisExample {
// //     function creditAmount(address) public  payable {

// //     }
// //     function getContractAddress() public view returns (address) {
// //         return address(this); //获取当前合约的地址
// //     }

// //     function getContractBalance() public view returns (uint) {
// //         return address(this).balance; //获取当前合约的余额

// //     }

// // }

// // contract HashExample {
// //     function getHash(string memory input) public view  returns (bytes32) {
// //         // 加密前需要先压缩,keccak必须对应bytes32的类型
// //         return keccak256(abi.encodePacked(input));
// //     }
// //     //随机数生成，仅限低安全使用

// //     function getRandomNumber() public view returns(uint){
// //         return uint(keccak256(abi.encodePacked(block.timestamp,msg.sender))) %100;
// //     }
// // }

// // contract Payment {
// //     function pay() public payable {}
// //     function getBalance() public view returns (uint) {
// //         return address(this).balance;
// //     }
// // }

// // contract Caller{
// //     function testMsg() public view returns(address){
// //         return msg.sender; //全局状态变量不可修改
// //     }

// //     function testTx() public view returns(address) {
// //         return tx.origin;
// //     }
// // }
// // 嵌套一个（类似钓鱼）合约
// // contract Callee{
// //     //0x1c91347f2A44538ce62453BEBd9Aa907C662b4bD
// //     //0x1c91347f2A44538ce62453BEBd9Aa907C662b4bD

// //     Caller caller;
// //     constructor(){
// //         caller = new Caller();
// //     }
// //     function testMsg() public view returns(address){
// //         return caller.testMsg(); //全局状态变量不可修改
// //     }
// //     //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// //     //使用tx.origin会绕过安全地址检查。
// //     function testTx() public view returns(address) {
// //         return  caller.testTx();
// //     }
// // }



// //Abi编码解码
// // contract AbiContract {
// //     function encodeFunc(string memory input) public view returns(bytes32){
// //         return abi.encode(input);
// //     }
// // }

// // //注重调用者
// // contract ABI {
// //     // 1. 编码
// //     function encodeData(string memory text,uint number) public pure returns(bytes memory a,bytes memory b){
// //         // 0x0000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000001200000000000000000000000000000000000000000000000000000000000000047a6f6f6400000000000000000000000000000000000000000000000000000000
// //         a = abi.encode(text,number); //编码
// //         // 0x7a6f6f640000000000000000000000000000000000000000000000000000000000000012 
// //         b = abi.encodePacked(text,number); //编码，和encode的区别是，会把encode后面生成的0都去掉，类似压缩
// //     }
// //     // 2. 解码
// //     function decodeData(bytes memory encodeData) public pure returns (string memory text,uint256 number){
// //         return abi.decode(encodeData, (string,uint));
// //     }

// //     // 函数选择器，默认返回一个长度为4的字节数组 这里有关子，主要用于ERC20
// //      function getSelector() public pure returns(bytes4) {
// //         return msg.sig;
// //      }
// //      //计算函数选择器
// //      function cSeletory(string memory func) public pure returns(bytes4) {
// //         return bytes4(keccak256(bytes(func)));
// //      }
// //     // 对函数编码
// //      //0xa9059cbb000000000000000000000000406ab5033423dcb6391ac9eeead73294fa82cfbc0000000000000000000000000000000000000000000000000000000000000064
// //      function transfer(address addr,uint256 amount) public pure returns(bytes memory) {
// //         return msg.data;
// //      }
// //      //0xa9059cbb000000000000000000000000406ab5033423dcb6391ac9eeead73294fa82cfbc0000000000000000000000000000000000000000000000000000000000000064
// //      function encodeFunc() public pure returns(bytes memory){
// //         return abi.encodeWithSignature("transfer(address,uint256)",0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc,100);
// //      }
// //      //哈希运算 得到的结果都是bytes32的类型
// //      function hashFunctionsss(string memory input ) public pure returns(bytes32,bytes32,bytes32){
// //          // 加密都是只接受字节码
// //          bytes memory data = abi.encode(input);
// //          return(
// //             keccak256(data),
// //             sha256(data),
// //             ripemd160(data)
// //          );
// //      }
// //      function hashFunctionsss1(string memory input ) public pure returns(bytes32,bytes32,bytes32){
// //          // 加密都是只接受字节码
// //          bytes memory data = abi.encodePacked(input);
// //          return(
// //             keccak256(data),
// //             sha256(data),
// //             ripemd160(data)
// //          );
// //      }
// //      // 数学运算 addmod = (x+y) %m     避免溢出
// //     function modularMath(uint256 x,uint256 y,uint256 m) public pure returns (uint256,uint256){
// //         return (
// //             addmod(x, y, m),
// //             mulmod(x, y, m)
             
// //         );
// //     }
// //     // 8.椭圆曲线恢复公钥
// //     //椭圆曲线主要是生成交易账户的签名  对交易签名复原出钱包的地址 v r s  死记吧
// //     function recoverAddress(bytes32 hash,uint8 v,bytes32 r,bytes32 s)  public pure returns(address) {
// //         return ecrecover(hash, v, r, s);
// //     }

// // }

// // //地址类型转换
// // contract exchangeContract{
// //     //地址类型转换
// //     function toBytes(address addr) public pure returns(bytes memory) {
// //        return abi.encodePacked(addr);
// //     } 
// //     // 获取地址的余额
// //     function getBalance(address addr) public view returns (uint256) {
// //         return addr.balance;
// //     }

// //     // 向地址转账
// //     function sendEther(address payable recipient) public payable {
// //         // recipient.transfer(msg.value);
// //         recipient.transfer(msg.value); // msg.value 表示合约交易时的ETH
// //     }

// //     // 调用地址的代码（低级别调用）
// //     function callContract(address addr, bytes memory data) public returns (bool, bytes memory) {
// //         (bool success, bytes memory result) = addr.call(data);
// //         return (success, result);
// //     }
// // }

// // //定义一个简单的接口
// // interface IERC20 {
// //     function transfer(address to,uint256 amount) external returns (bool);
// //     function balanceOf(address account) external view returns(uint256);
// // }
// // // 需要实现接口
// // contract IERRC20Imp is IERC20{
// //         function transfer(address to,uint256 amount) public pure returns (bool){
// //             return true;
// //         }
// //         function balanceOf(address account) public view returns(uint256){
// //                 return 1;
// //         }


// // }

// // contract MyContract {
// //     // 使用接口与另一个合约交互
// //     function transferToken(address tokenAddress, address to, uint256 amount) public returns (bool) {
// //         IERC20 token = IERC20(tokenAddress);
// //         return token.transfer(to, amount);
// //     }

// //     // 获取代币余额
// //     function getTokenBalance(address tokenAddress, address account) public view returns (uint256) {
// //         IERC20 token = IERC20(tokenAddress);
// //         return token.balanceOf(account);
// //     }
// // 

// //接口的例子 以前的用法，知道Bank实例
// // 定义一个简单的银行接口
// interface IBank {
//     function deposit() external payable;
//     function withdraw(uint256 amount) external;
//     function getBalance() external view returns (uint256);
// }

// // 实现银行接口的合约
// contract Bank is IBank {
//     mapping(address => uint256) public balances;

//     function deposit() external payable override {
//         require(msg.value > 0, "The deposit amount must be greater than 0");
//         balances[msg.sender] += msg.value;
//     }

//     function withdraw(uint256 amount) external override {
//         require(balances[msg.sender] >= amount, "Insufficient balance"); //余额不足
//         balances[msg.sender] -= amount;
//         payable(msg.sender).transfer(amount);
//     }

//     function getBalance() external view override returns (uint256) {
//         return balances[msg.sender];
//     }
// }

// // 使用银行接口的合约 Y
// contract BankUser {
//     // 银行合约实例
//     //0x11bcD925D9c852a3eb40852A1C75E194e502D2b9
//     //0x11bcD925D9c852a3eb40852A1C75E194e502D2b9
//     Bank  public b;
//         // 构造函数，接收银行合约地址
//     constructor(address bankAddress) {
//         b = Bank(bankAddress);
//     }
//     //存钱
//     function depositToBank(address bankAddress) external payable {
//         // IBank bank = IBank(bankAddress);
//         b.deposit{value: msg.value}();
//     }
//     //取钱
//     function withdrawFromBank(address bankAddress, uint256 amount) external {
//         // IBank bank = IBank(bankAddress);
//         b.withdraw(amount);
//     }
//     //需要有2个兜底函数，防止代币丢失
//     //receive / fallback
//     receive() external payable {}
//     fallback() external payable { }
//     function getBankBalance(address bankAddress) external view returns (uint256) {
//         // IBank bank = IBank(bankAddress);
//         return b.getBalance();
//     }
// }



//接口的例子 以前的用法，无法获取Bank实例代码，但知道Bank的接口IBank
// 定义一个简单的银行接口
interface IBank {
    function deposit() external payable;
    function withdraw(uint256 amount) external;
    function getBalance() external view returns (uint256);
}

// 实现银行接口的合约
contract Bank is IBank {
    mapping(address => uint256) public balances;

    function deposit() external payable override {
        require(msg.value > 0, "The deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external override {
        require(balances[msg.sender] >= amount, "Insufficient balance"); //余额不足
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalance() external view override returns (uint256) {
        return balances[msg.sender];
    }
}

// 使用银行接口的合约 Y
contract BankUser {
    // 银行合约实例
    //0x11bcD925D9c852a3eb40852A1C75E194e502D2b9
    //0x11bcD925D9c852a3eb40852A1C75E194e502D2b9
    // Bank  public b;
    //     // 构造函数，接收银行合约地址
    // constructor(address bankAddress) {
    //     b = Bank(bankAddress);
    // }
    //存钱
    function depositToBank(address bankAddress) external payable {
        IBank bank = IBank(bankAddress); //接口名+地址，拿到已经被实现的接口实例
        bank.deposit{value: msg.value}();
    }
    //取钱
    function withdrawFromBank(address bankAddress, uint256 amount) external {
        IBank bank = IBank(bankAddress);
        bank.withdraw(amount);
    }
    //需要有2个兜底函数，防止代币丢失
    //receive / fallback
    receive() external payable {}
    fallback() external payable { }
    function getBankBalance(address bankAddress) external view returns (uint256) {
        IBank bank = IBank(bankAddress);
        return bank.getBalance();
    }
}
