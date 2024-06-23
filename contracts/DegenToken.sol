// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {
    struct Item {
        string name;
        uint256 price; 
    }

    mapping(uint256 => Item) private merchandise;
    uint256 private merchandiseCount;

    
    event Redeem(address indexed account, uint256 indexed itemId);

    bool private _paused;
    constructor() ERC20("Degen Gaming Token", "DGT") Ownable(msg.sender) {
        _paused = false; 
       
        addMerchandise("40 UC Pack", 100);
        addMerchandise("100 UC Pack", 200);
        addMerchandise("200 UC Pack", 500);
        addMerchandise("400 UC Pack", 1500);
        addMerchandise("1000 UC Pack", 5000);
        addMerchandise("2000 UC Pack", 10000);
        addMerchandise("10000 UC Pack", 15000);
    }

    
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    
    function redeem(uint256 itemId) public {
        require(itemId < merchandiseCount, "Invalid merchandise choice");
        uint256 price = merchandise[itemId].price;
        require(balanceOf(msg.sender) >= price, "Insufficient balance");

        _burn(msg.sender, price);
        emit Redeem(msg.sender, itemId);
    }

    
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

   
    function pause() public onlyOwner {
        _paused = true;
    }

    
    function unpause() public onlyOwner {
        _paused = false;
    }

    
    function paused() public view returns (bool) {
        return _paused;
    }

   
    function withdrawEth() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

   
    function addMerchandise(string memory name, uint256 price) public onlyOwner {
        merchandise[merchandiseCount] = Item(name, price);
        merchandiseCount++;
    }

   
    function getMerchandiseList() public view returns (string[] memory, uint256[] memory) {
        string[] memory names = new string[](merchandiseCount);
        uint256[] memory prices = new uint256[](merchandiseCount);

        for (uint256 i = 0; i < merchandiseCount; i++) {
            names[i] = merchandise[i].name;
            prices[i] = merchandise[i].price;
        }

        return (names, prices);
    }

   
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(!_paused, "Token transfers are paused");
        return super.transfer(recipient, amount);
    }

    
    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(!_paused, "Token transfers are paused");
        
        uint256 currentAllowance = allowance(sender, _msgSender());
        uint256 senderBalance = balanceOf(sender);
        
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");

        bool success = super.transferFrom(sender, recipient, amount);
        require(success, "ERC20: transferFrom failed");

        return success;
    }

    
    function approve(address spender, uint256 amount) public override returns (bool) {
        return super.approve(spender, amount);
    }

    
    receive() external payable {}
}
