// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721{

    uint256 private s_tokenCounter = 0; // untuk menghitung banyaknya token
    string private s_sadSvg;
    string private s_happySvg;

    constructor(                // constructor mengambil dari constructor di NFT721 (name, symbol)
        string memory sadSvg,
        string memory happySvg
    ) ERC721("MoonNft","Md"){
        s_tokenCounter = 0;
        s_sadSvg = sadSvg;
        s_happySvg = happySvg;
    } 

    function mintNft() public{  // agar orang bisa mintNft, Minting an NFT means creating a unique token on a blockchain
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory){
        
    }
}