// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    event TokensRedeemed(address indexed redeemer, uint256 amount, string reward);
    event LoyaltyBadgeEarned(address indexed player, uint256 amount, string badge);

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

        if (_amount == 300) {
            _burn(_redeemer, _amount);
            emit TokensRedeemed(_redeemer, _amount, "Degen Gradient Box");
        } else if (_amount == 200) {
            _burn(_redeemer, _amount);
            emit TokensRedeemed(_redeemer, _amount, "Degen Legendary Box");
        } else if (_amount == 100) {
            _burn(_redeemer, _amount);
            emit TokensRedeemed(_redeemer, _amount, "Degen Elite Box");
        } else {
            revert("Not enough tokens for any reward");
        }
    }

    function earnLoyaltyBadge(address _player, uint256 _amount) external {
        require(balanceOf(_player) >= _amount, "The specified address does not have enough Degen Tokens to earn this badge");

        if (_amount >= 80) {
            _burn(_player, _amount);
            emit LoyaltyBadgeEarned(_player, _amount, "Degen Gradient Badge");
        } else if (_amount >= 60) {
            _burn(_player, _amount);
            emit LoyaltyBadgeEarned(_player, _amount, "Degen Legendary Badge");
        } else if (_amount >= 20) {
            _burn(_player, _amount);
            emit LoyaltyBadgeEarned(_player, _amount, "Degen Elite Badge");
        } else {
            revert("Not enough tokens for any badge");
        }
    }
}
