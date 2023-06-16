// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "hardhat/console.sol";

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract myepicnft is ERC721{
        using Counters for Counters.Counter;
        Counters.Counter private _tokenIds;

        constructor() ERC721 ("SquareNFT", "SQUARE"){
            console.log("this is my nft contract");
        }

        function makeAnEpicNFT() public {
            // Get the current tokenId, this starts at 0.
            uint256 newItemId = _tokenIds.current();

            // Actually mint the NFT to the sender using msg.sender.
            _safeMint(msg.sender, newItemId);

            // Return the NFT's metadata
            tokenURI(newItemId);

            // Increment the counter for when the next NFT is minted.
            _tokenIds.increment();
            
        }

        function tokenURI(uint256 _tokenId) public view override returns (string memory){
            require(_exists(_tokenId));
            console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
            return string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    "data:application/json;base64,ewogICAgIm5hbWUiOiAiWW91bmdQZW50YWdvbkhhY2tlciIsCiAgICAiZGVzY3JpcHRpb24iOiAibXkgbmZ0IiwKICAgICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lJSEJ5WlhObGNuWmxRWE53WldOMFVtRjBhVzg5SW5oTmFXNVpUV2x1SUcxbFpYUWlJSFpwWlhkQ2IzZzlJakFnTUNBek5UQWdNelV3SWo0S0lDQWdJRHh6ZEhsc1pUNHVZbUZ6WlNCN0lHWnBiR3c2SUhKbFpEc2dabTl1ZEMxbVlXMXBiSGs2SUhObGNtbG1PeUJtYjI1MExYTnBlbVU2SURFMGNIZzdJSDA4TDNOMGVXeGxQZ29nSUNBZ1BISmxZM1FnZDJsa2RHZzlJakV3TUNVaUlHaGxhV2RvZEQwaU1UQXdKU0lnWm1sc2JEMGlaR0Z5YTJkeVpXVnVJaUF2UGdvZ0lDQWdQSFJsZUhRZ2VEMGlOVEFsSWlCNVBTSTFNQ1VpSUdOc1lYTnpQU0ppWVhObElpQmtiMjFwYm1GdWRDMWlZWE5sYkdsdVpUMGliV2xrWkd4bElpQjBaWGgwTFdGdVkyaHZjajBpYldsa1pHeGxJajVaYjNWdVoxQmxiblJoWjI5dVNHRmphMlZ5UEM5MFpYaDBQZ284TDNOMlp6ND0iCn0="
            )
            );
        }
}