// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "./BimaCoin.sol";

contract HealthInsurance is ReentrancyGuard{

    using Address for address;

    IERC20 public immutable bimaCoin;
    
    constructor (address tokenAddress) {
        bimaCoin = IERC20(tokenAddress);
    }
    
    address public merchant;
    address public user;

    uint256 public exchangeRate;
    
    uint256 private constant FIXED_FEE = 1;



    mapping(address => uint256) public tokenBalance;

    mapping(address => bool) public registeredMerchants;

    function registerMerchant(address _merchant, uint256 _exchangeRate) public returns (bool) {                
        require (registeredMerchants[_merchant] != registeredMerchants[msg.sender], "Merchant not registered!");
        
        exchangeRate = _exchangeRate;
        return true;
    }

    //vendor purchases tokens
    function makePurchase(uint256 amount) public {
        require(registeredMerchants[msg.sender], "Merchant not registered");
        bimaCoin.transfer(msg.sender, amount);
    }
    
    //user receives tokens from merchant
    function receiveTokens(address customer, uint256 amount) public {
        bimaCoin.transfer(customer, amount);
        
    }

    function makeClaim() public {
        uint256 tokens = tokenBalance[msg.sender];
        require(tokens > 0, "No tokens available");
        tokenBalance[msg.sender] = 0;

    }

    function fixedFee() external pure returns (uint256) {
        return FIXED_FEE;
    }
}
