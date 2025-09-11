pragma solidity >=0.8.2 <0.9.0;

// contract A {
//     uint public x;
//     bool public b;
//     uint public y;
//     function f() public pure returns (uint, bool, uint) {
//         return (7, true, 2);
//     }

//     function g() public {
//         (uint x, bool b, uint y) = f();  // 多值赋值
        
//     }
// }

// contract C {
//     uint public x;
//     bool public b;
//     uint public y;
//     function f() public pure returns (uint, bool, uint) {
//         return (7, true, 2);
//     }

//     function g() public {
//         (uint x, bool b, uint y) = f();  // 多值赋值
        
//     }
// }

// contract HelloSol {
//     uint public dddd = 100;
//     function contractFunc(int a,int b) public  returns (int) {
//         // 函数体
//         return a + b;
//     }

//     function arithmetic(uint _a, uint _b) public   returns (uint o_sum, uint o_product) {
//         o_sum = _a + _b;
//         o_product = _a * _b;    
//     } 
//         function arithmetic2(uint _a, uint _b) public pure  returns (uint o_sum, uint o_product) {
//         o_sum = _a + _b;
//         o_product = _a * _b;    
//     } 
//         function arithmetic3(uint _a, uint _b) public pure  returns (uint o_sum, uint o_product) {
//         o_sum = _a + _b;
//         o_product = _a * _b;    
//     } 
    
// }
// 函数可见性
// contract VisibilityExample {
//     function privateFunction() private pure returns (string memory) {
//         return "Private";
//     }
    
//     function internalFunction() internal pure returns (string memory) {
//         return "Internal";
//     }
    
//     function externalFunction() external pure returns (string memory) {
//         return "External";
//     }
    
//     function publicFunction() public pure returns (string memory) {
//         return "Public";
//     }
// }

// contract mainC001 {
//     // 状态可变性修饰符
//     uint256 public data = 10000;
//     function dealDadta() public returns (uint256){
//         data = this.getData()+1;
//         return data;
//     }
//     function getData() external view returns(uint256) {
//         return data;
//     }
//     function deposit() external payable {
//         // 接收以太币
//     }
// }

// contract SimpleStorage {
//     uint256 private data;

//     function setData(uint256 _data) external {
//         data = _data;  // 修改状态变量
//     }

//     function getData() external view returns (uint256) {
//         return data;  // 读取状态变量
//     }

//     function add(uint256 a, uint256 b) external pure returns (uint256) {
//         return a + b;  // 纯计算函数
//     }

//     function deposit() external payable {
//         // 接收以太币
//     }
// }

// contract ExampleContract{
//     //状态变量 （存储在 storage => stateDB）
//     uint256 public stateVar = 100;
//     mapping(address => uint256) public balances;
//     uint256[] someStorageArray;


//     // 常量 存在代码字节码中
//     uint256 public constant CONSTANT_VAR = 100;

//     // immutable（部署时确定，在代码区）
//     uint256 public immutable IMMUTABLE_VAR;

//     // 部署时才会启用
//     constructor() {
//         IMMUTABLE_VAR=500;
//     }

//     //memory 存在内存中
//     function testMemory() public pure returns(string memory) {

//         return "testMemory";
//     }

//     function claimVar() public view returns (uint256){
//         //  === 存在 memory
//         uint256[] memory memoryArray = new uint256[](3);
//         string memory str = "Hello";
//         bytes memory tempBytes = new bytes(10);

        
//         // ====  存在 stack
//         uint256 stackVar = 123;
//         bool flag = true;
//         address sender = msg.sender;
//         uint8 smallNum = 255;
//     }

//         // === storage 指针 指向 stateDB
//     // uint256 [] storage storageArray  = someStorageArray;
//     // mapping(address => uint256) storage storageMap = balances;
//     //纯函数中的所有变量都在栈中
//     function pureFunction(uint256 x) public pure returns (uint256){
//         uint256 y = x * 2;
//         return y;
//     }
//     //viewFunction 比 pureFunction多一个sload操作，消耗的gas也会比purefucntion多
//     function viewFunction(uint256 x) public view returns (uint256){
//         return stateVar;
//     }

//     //定义结构体
//     struct TempStruct {
//         uint256 value;
//         string name;
//     }

//     function memoryTempStruct(string calldata name, uint val) public view returns(TempStruct memory) {

//         // name = string.concat(name, "abc");
//         // calldata 是不可变的   memory是可变的
//         // 可变不能直接赋值给不可变，不可变可以赋值给可变

//         TempStruct memory ts = TempStruct({
//             name: name,
//             value: val
//         });
//         return ts;
//     }

// }


// contract TestContract {
    
//     struct TempStruct {
//         uint256 value;
//         string name;
//     }

//     function calldataTempStruct(TempStruct calldata ts) public  view returns (TempStruct memory) {

//         // ts.name = "qaq";

//         // TempStruct memory ts2 = ts;
//         // return ts2;
//         // TempStruct calldata ttt = TempStruct(12, "zood");
//         return _call(ts);

//         //  ts;

//     }
//     function _call(TempStruct calldata ts) public pure returns (TempStruct memory) {
//         return ts;
//     }



// }

// contract ArrContract {
//     uint[10] tens;
//     string[4] adaArr= ["1","2","3"];
//     uint[] many; 
//     uint[] public u = [1, 2, 3];
    
//     function addManyU(uint a) public returns (uint[] memory us){
//         u.push(a);
//         return u;
//     }

//     bytes public _data = new bytes(10);

//     // //可遍历
//     // function forData() public view returns (bytes[] memory datas) {
//     //     bytes[] memory arr = new bytes[](10);
//     //     for(byte i = 0;i<10;i++){
//     //         //string 不支持使用下标索引进行访问。bytes 可以通过下标索引进行读访问。
//     //         arr.push(i);
//     //     }
//     // }



// }

// contract ArrayContract {
//     bytes public bs = "abc\x22\x22";
//     bytes public _data = new bytes(10);
    
//     string public str0;
//     string public err1= "TingXiong";

//     function readBytesIndexByBytes1(bytes1 d) public view returns (int256) {
//         for (uint256 i=0;i<bs.length;i++){
//             if(bs[i]== d){
//                 return int256(i);
//             }
//         }
//         return -1;
//     }
// }

//回顾EVM特性章节： https://github.com/MetaNodeAcademy/Base2-Solidity/blob/main/1-solidity-base/1.2%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B/03.EVM%E7%89%B9%E6%80%A7.md

// 在 Solidity 中，直接存储在栈（Stack）中的基本类型包括，同时消耗的gas最少
// contract StackTypes {
//     function integerTypes() public pure{
//         //所有整型都存在于stack
//         uint256 a = 1;
//         uint8 b =2;
//         int256 c= -1;
//         int8 d = -2;
//     }
//     function viewIntergerTypes() public view returns (uint256,uint8,int256,int8) {
//         uint256 a = 1;
//         uint8 b =2;
//         int256 c= -1;
//         int8 d = -2;
//         return(a,b,c,d);
//     }
//     //地址（Address）
//     function addressTypes() public view returns(address, address payable ){
//     address addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
//     address payable payableAddr = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
//     return(addr,payableAddr);
//     }
//     //固定大小字节数组（Fixed-size Bytes）
//     function bytesTypes() public pure {
//         bytes1 b1 = 0x12;
//         // bytes32 b32 = 0x123;
//     }
//     //枚举（Enum）
//     enum Status { Active, Inactive }
//     uint a = 0;
//     function enumTypes  () public pure {
//         //使用pure仍能使用编译时就被解析为固定值的变量，如枚举
//         //         枚举值是编译时常量：Status.Active 是枚举类型的一个成员，它在编译时就被解析为一个固定的值（通常是 uint8 类型的 0）。这意味着访问 Status.Active 并不涉及读取合约存储（状态变量），而是直接使用编译时已知的常量值。

//         // 局部变量存储在栈上：在函数内部声明的局部变量（如 status）存储在栈（stack）上，而不是合约存储（storage）中。操作栈上的变量不会影响合约状态，也不会读取状态，因此这并不违反 pure 函数的规则。

//         // 纯函数的允许操作：pure 函数允许使用编译时常量、执行内部计算、定义局部变量以及使用函数参数。这些操作都不需要访问存储。
//         Status status = Status.Active;  // 实际存储为 uint8
//         // uint b = a;
//     }

//     enum Animal {Duck,Pig,Dog}
//     function choiceAnimalTypes () public pure {
//         Animal animal1 = Animal.Duck;
//         Animal animal2 = Animal.Dog;
//         Animal animal3 = Animal.Pig;

//     }
// }


// contract StringExample {
//     // Storage 字符串
//     string public storageStr = "hello";  // 存储在链上
    
//     function example() public pure {
//         // Memory 字符串
//         string memory memoryStr = "world";
        
//         // 栈中存储字符串的引用
//         // 实际字符串数据在 Memory 或 Storage
//     }
// }


// contract MappingExample {
//     // 只能声明为 Storage
//     mapping(address => uint) public balances112312;
    
//     function example() public {
//         // ❌ 不能创建 Memory 映射
//         // mapping(address => uint) memory memoryMap;  // 错误
//         balances112312[msg.sender] = 100;
//         // 只能在 Storage 中使用
//         // balances[msg.sender] = 100;
//     }
// }
contract dynamicContract{
    // 引用类型示例
    bytes public dynamicBytes;     // 动态字节数组，存储在存储区(storage)
    bytes public dynamicBytes1;     // 动态字节数组，存储在存储区(storage)

    bytes32 public fixedBytes;     // 固定长度字节数组，是值类型

    function example() public {
        // 动态分配内存
        dynamicBytes = new bytes(2);
        dynamicBytes1 = new bytes(2);
        dynamicBytes1.push(0x12);
                dynamicBytes1.push(0x12);

        dynamicBytes1.push(0x12);

        dynamicBytes1.push(0x12);

        dynamicBytes1.push(0x12);

        dynamicBytes1.push(0x12);

        dynamicBytes1.push(0x12);

        dynamicBytes1.push(0x12);

        dynamicBytes1.push(0x12);

        dynamicBytes[0] = 0x12;
        dynamicBytes[1] = 0x34;
        
        // 可以改变长度
        dynamicBytes.push(0x56);
    }
}
