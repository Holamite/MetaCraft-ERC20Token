//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OlaToken is ERC20, Ownable {
    constructor(
        address initialOwner
    ) ERC20("OlaToken", "OTK") Ownable(initialOwner) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address burner, uint256 amount) public {
        _burn(burner, amount);
    }

    function transfer(
        address to,
        uint256 value
    ) public override returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
}
