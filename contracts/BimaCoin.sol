// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "hardhat/console.sol";

error BimaCoin__NotEnoughBalance();

contract BimaCoin {
        mapping (address => uint) public balanceOf;
        uint256 private i_tokensToBeMinted;

        event tokensMinted(
            uint256 indexed numberTokensMinted,
            address owner    
        );

        constructor(uint256 tokensToBeMinted) {
                balanceOf[tx.origin] = tokensToBeMinted;
                i_tokensToBeMinted= tokensToBeMinted;
                emit tokensMinted(tokensToBeMinted, msg.sender);
        }

        function transfer(address receiver, uint amount) public returns(bool sufficient) {
                if (balanceOf[msg.sender] < amount) {
                        // return false;
                revert BimaCoin__NotEnoughBalance();
                }

                balanceOf[msg.sender] -= amount;
                balanceOf[receiver] += amount;
                 console.log(
        "Transferring from %s to %s %s BimaCoins",
        msg.sender,
        receiver,
        amount
    );
                return true;
        }

        function getBalance(address addr) public view returns(uint) {
                return balanceOf[addr];
        }

        function getMintedTokenBalance() public view returns(uint256){
                return i_tokensToBeMinted;
        }
}