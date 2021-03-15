pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";

contract BigToken is ERC20, ERC20Detailed {
    address payable owner;

    modifier onlyOwner {
        require(msg.sender == owner, "You do not have permissions to mint this token");
        _; 
    }

    constructor(uint initial_supply) ERC20Detailed("CCBIG Community Token", "BIG", 18) public {
        owner = msg.sender;
        _mint(owner, initial_supply);
        
        
    }

    // @TODO: Add the `onlyOwner` modifier to this function after `public`
    function mint(address recipient, uint amount) public {
        _mint(recipient, amount);
        
    }
}
