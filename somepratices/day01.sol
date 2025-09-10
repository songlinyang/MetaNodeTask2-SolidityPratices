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


contract UserRegistry {
    struct User {
        string name;
        uint256 age;
        bool isRegistered;
    }
    mapping(address => User) public users;
    function registerUser(string memory name, uint256 age) public {
        require(!users[msg.sender].isRegistered, "User already registered");
        users[msg.sender] = User(name, age, true);
    }
    function getUser(address user) public view returns (string memory, uint256, bool) {
        require(users[user].isRegistered, "User not registered");
        User memory u = users[user];
        return (u.name, u.age, u.isRegistered);
    }
}