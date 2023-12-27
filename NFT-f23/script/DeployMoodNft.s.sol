// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {Script} from "../lib/forge-std/src/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";    // use for encodeNfts to String

contract DeployMoodNft is Script{
    function run() external returns(MoodNft){

    }

    // digunakan untuk base64 -i . . . 
    function svgToImageURI(string memory svg) public pure returns(string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";   // menjadi prefix
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}