// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    event TokensRedeemed(address indexed redeemer, uint256 amount, string reward);
    event LoyaltyBadgeEarned(address indexed player, uint256 amount, string badge);

    mapping(address => string[]) public inventory;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens");
        transfer(_receiver, _value);
    }

    function redeemTokens(address _redeemer, uint256 _amount) external {
        require(balanceOf(_redeemer) >= _amount, "The specified address does not have enough Degen Tokens to redeem this reward");

        string memory reward;
        if (_amount == 300) {
            reward = "Degen Gradient Box";
        } else if (_amount == 200) {
            reward = "Degen Legendary Box";
        } else if (_amount == 100) {
            reward = "Degen Elite Box";
        } else {
            revert("Not enough tokens for any reward");
        }

        _burn(_redeemer, _amount);
        inventory[_redeemer].push(reward);
        emit TokensRedeemed(_redeemer, _amount, reward);
    }

    function earnLoyaltyBadge(address _player, uint256 _amount) external {
        require(balanceOf(_player) >= _amount, "The specified address does not have enough Degen Tokens to earn this badge");

        string memory badge;
        if (_amount == 80) {
            badge = "Degen Gradient Badge";
        } else if (_amount == 60) {
            badge = "Degen Legendary Badge";
        } else if (_amount == 20) {
            badge = "Degen Elite Badge";
        } else {
            revert("Not enough tokens for any badge");
        }

        _burn(_player, _amount);
        inventory[_player].push(badge);
        emit LoyaltyBadgeEarned(_player, _amount, badge);
    }

    function getInventory(address _owner) external view returns (string[] memory) {
        return inventory[_owner];
    }

    function redeemRules() external pure returns (string memory) {
        return "Loyalty Badges:\n"
               "20 DGN - Degen Elite Badge\n"
               "60 DGN - Degen Legendary Badge\n"
               "80 DGN - Degen Gradient Badge\n\n"
               "Degen Boxes:\n"
               "100 DGN - Degen Elite Box\n"
               "200 DGN - Degen Legendary Box\n"
               "300 DGN - Degen Gradient Box";
    }
}
