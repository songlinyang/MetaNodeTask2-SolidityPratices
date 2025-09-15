// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721URIStorage, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage {
    uint256 private _tokenIds;
    constructor() ERC721("MyNFT", "MNFT") {}

    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {
        _tokenIds+=1;
        uint256 newItemId =_tokenIds;
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}
//利用IPFS上传元数据
//元数据为：
//my-nft-metadata.json
// {
//   "name": "My NFT",
//   "description": "world peace NFT",
//   "image": "http://bafybeifwbylj5qjewiyhnkfado22ki7nyl3r4d2npvexnzhlr7rhz4zz6u.ipfs.localhost:8080/?filename=68619267-a61e-4883-8b91-fb0f4a7a361c.jpeg"
// }
//tokenURI: https://bafybeihyhbzkkm7h6fkbsyieg2vt4uzihcpfjx7vvwjhjjtbwldibqsrqq.ipfs.dweb.link?filename=my-nft-metadata.json
