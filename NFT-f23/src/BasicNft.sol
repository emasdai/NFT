// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721{
    uint256 private s_tokenCounter; // storage variable

    constructor() ERC721("Dogie","DOG"){
        s_tokenCounter = 0;
    }

    function minNFT() public{

    }

    // digunakan untuk memanggil NFT, override base function yang ada di ERC721.sol dan return string untuk mendapatkan alamat (ipfs) NFT
    function tokenURI(uint256 tokenId) public view override returns(string memory){ 
        
    }
}