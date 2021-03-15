pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0-beta.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0-beta.0/contracts/ownership/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0-beta.0/contracts/drafts/Strings.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0-beta.0/contracts/drafts/Counters.sol";


contract SimpleERC721Token is ERC721Full, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
 

    constructor () public ERC721Full("CCBIG Founders Card", "BIGF") {
        _setBaseURI("https://nordichousetrade.com/founder");
    }

    function setBaseURI(string memory baseURI) public onlyOwner {
        _setBaseURI(baseURI);
    }
    
    function baseTokenURI() public pure returns (string memory) {
        return "https://nordichousetrade.com/founder";
    }
    
    

    function mint(address to) public onlyOwner {
        _tokenIds.increment();

        uint256 newTokenId = _tokenIds.current();
        _mint(to, newTokenId);
        _setTokenURI(newTokenId, Strings.fromUint256(newTokenId));
    }
}