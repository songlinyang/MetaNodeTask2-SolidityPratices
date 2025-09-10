// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// contract SolContract {
//     // 都是默认存储在storage内
//     uint8[] public arrs;
//     uint8 b;

//     function addElement(uint8 value) external returns (uint8[] memory) {
//         arrs.push(value);
//         return arrs;
//     }

//     function readArrsElementAndReturn(uint8 index) public view  returns (uint8 ) {
//         uint8 i=0;
//         for(;;){
//             if (i==arrs.length-1){
//                 return arrs[i];
//             }
//             i++;
//         }
//     }
//     function efficientLoop(uint8[] memory arr) public { 
//         uint length = arrs.length; 
//         for(uint8 i = 0; i < length; i++) { 
//             b +=arrs[i];
//         } 
//     } 

//     function resultAll() public returns (uint8){
//         efficientLoop(arrs);
//         return b;
//     }

//     function lookB() public view returns (uint8){
//         return b;
//     }
//     struct TempStruct{
//         uint a;
//         uint b;
//     }
//     mapping(string => uint) public a ;
//     function setAmount() public{
//         a["amount"]=1;
//     }
//     function getAmount() public view returns (uint){
//         return a["amount"];
//     }

// }

// contract MultiMapping {
//     mapping(address => mapping(string => uint256)) public userBalances;
//     function setUserBalance(string memory currency, uint256 amount) public {
//         userBalances[msg.sender][currency] = amount;
//     }
//     function getUserBalance(address user, string memory currency) public view returns (uint256) {
//         return userBalances[user][currency];
//     }

    
// }

// contract UserManager {
//     struct User {
//         string name;
//         uint256 age;
//         address wallet;
//     }
//     mapping(address => User) public users;
//     function setUser(string memory name, uint256 age) public {
//         users[msg.sender] = User(name, age, msg.sender);
//     }
//     function getUser(address userAddress) public view returns (string memory, uint256, address) {
//         User memory user = users[userAddress];
//         return (user.name, user.age, user.wallet);
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