// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";    // use for encodeNfts to String

contract MoodNft is ERC721{

    error MoodNft_CantFlipMoodIfNotOwner();

    uint256 private s_tokenCounter = 0; // untuk menghitung banyaknya token
    string private s_sadSvgImageURI;
    string private s_happySvgImageURI;

    enum Mood{
        HAPPY,
        SAD
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(                // constructor mengambil dari constructor di NFT721 (name, symbol)
        string memory sadSvgImageURI,
        string memory happySvgImageURI
    ) ERC721("MoonNft","Md"){
        s_tokenCounter = 0;
        s_sadSvgImageURI = sadSvgImageURI;
        s_happySvgImageURI = happySvgImageURI;
    } 

    function mintNft() public{  // agar orang bisa mintNft, Minting an NFT means creating a unique token on a blockchain
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;   // defaultnya adalah HAPPY
        s_tokenCounter++;
    }

    function flipMood(uint256 tokenId) public{
        // hanya owner NFT yang bisa flip mood Nftnya
        if (!isApprovedForAll(msg.sender, tokenId)){
            revert MoodNft_CantFlipMoodIfNotOwner();
        }

        // jika happy maka akan flip ke sad dan sebaliknya
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY){
            s_tokenIdToMood[tokenId] == Mood.SAD;
        } else{
            s_tokenIdToMood[tokenId] == Mood.HAPPY;
        }
    }
    function _baseURI() internal pure override returns(string memory){  // digunakan untuk base metadata
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory){
        string memory imageURI;
        if(s_tokenIdToMood[tokenId] == Mood.HAPPY){
            imageURI = s_happySvgImageURI;
        }else{
            imageURI = s_sadSvgImageURI;
        }

        return string(      // untuk encode dari bytes32 ke string
            abi.encode(
                _baseURI(),Base64.encode(
                    bytes(abi.encodePacked(
                        '{"name: "' , 
                        name(),
                        '"image": ',
                        imageURI,
                        '"}')
                    )
                )
            )
        );
    }
}