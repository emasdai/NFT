// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "../lib/forge-std/src/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test{
    DeployBasicNft public deployer;
    BasicNft public basicNft;

    address public USER = makeAddr("user");
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    // test untuk memastikan nama NFt benar
    function testNameisCorrect() public view{
        string memory expectedName = "Dogie";  // ekspektasi nama yang benar
        string memory actualName = basicNft.name(); // mengambil dari basicNft -> ERC721 dan mengambil fungsi name() di ERC721
        // convert string ke bytes agar bisa assert (karena string adalah variable yang kompleks)
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));   // apakah expectedName == actualName??

    }

    // test apakah USER memiliki balance dan bisa memilih NFT
    function testCanMintAndHaveABalance() public{
        vm.prank(USER);
        basicNft.minNFT(PUG);
        assert(basicNft.balanceOf(USER) == 1);
        assert(
            // memastikan tokenURI mengarah kepada NFT, menggunakan keccak256(abi.encodePacked()); untuk mengubah convert string ke bytes32
            keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }

    
}