//ERC20权限控制
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// contract AccessControlERC20MintBase is ERC20, AccessControl {
//     // Create a new role identifier for the minter role
//     bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

//     error CallerNotMinter(address caller);

//     constructor(address minter) ERC20("MyToken", "TKN") {
//         // Grant the minter role to a specified account
//         _grantRole(MINTER_ROLE, minter);
//     }

//     function mint(address to, uint256 amount) public {
//         // Check that the calling account has the minter role
//         if (!hasRole(MINTER_ROLE, msg.sender)) {
//             revert CallerNotMinter(msg.sender);
//         }
//         _mint(to, amount);
//     }
// }

contract AccessControlERC20Mint is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    constructor(address minter, address burner) ERC20("MyToken", "TKN") {
        _grantRole(MINTER_ROLE, minter);
        _grantRole(BURNER_ROLE, burner);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public onlyRole(BURNER_ROLE) {
        _burn(from, amount);
    }
}
