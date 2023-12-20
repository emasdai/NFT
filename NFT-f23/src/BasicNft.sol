// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721{
    uint256 private s_tokenCounter; // storage variable, untuk menghitung banyaknya NFT
    mapping(uint256 => string) private s_tokenIdToUri;  // untuk memindahkan variable tokenID pada link tokenURI

    constructor() ERC721("Dogie","DOG"){        // didapat dari konstuktor ERC721
        s_tokenCounter = 0;
    }

    function minNFT(string memory tokenUri) public{  // agar orang bisa memilih NFT yang diinginkan (String)
        s_tokenIdToUri[s_tokenCounter] = tokenUri;  //  token id pindah ke token Uri (string) => token uri[indexnya] = tokenUri
        _safeMint(msg.sender, s_tokenCounter); // balance + 1
        s_tokenCounter++; // token akan bertambah
    }

    // digunakan untuk memanggil NFT, override base function yang ada di ERC721.sol dan return string untuk mendapatkan alamat (ipfs) NFT
    function tokenURI(uint256 tokenId) public view override returns(string memory){ 
        return s_tokenIdToUri[tokenId]; // return string dari tokenURI
    }
}