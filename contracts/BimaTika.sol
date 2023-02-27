// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
// import "./BimaCoin.sol"

contract HealthInsurance is ReentrancyGuard{
    
    
    /**
     * we can choose 1 of 2 implementations.. 
     * Using a stablecoin provided by FileCoin that is tagged to the USDC and FIL called oneFIL
     * or using our own token, BimaCoin...
     */



    //using oneFIL
    address public constant oneFIL = //oneFIL address

    uint256 public fixedFee = 10;

    mapping(address => uint256) public tokenBalance;

    mapping(address => bool) public registeredMerchants;
    
    
    
    
    



    function registerMerchant(address merchant, uint256 exchangeRate) public returns (bool) {
        
        
        registeredMerchants[merchant] = true;
    }



    function makePurchase() public {
        require(registeredMerchants[msg.sender], "Merchant not registered");


        tokenBalance[msg.sender] += msg.value / exchangeRate;
    }
    


    
    function makeClaim() public {
        uint256 tokens = tokenBalance[msg.sender];


        require(tokens > 0, "No tokens available");


        tokenBalance[msg.sender] = 0;


        // perform claim processing logic here
        // payment to health care service provider
    }
}
