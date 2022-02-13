// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * title: EWallet
 *  
 */

contract Wallet {

    address payable manager;

    constructor() {
        manager = payable(msg.sender);
    }

    modifier restricted {
        require(msg.sender == manager);
        _;
    }

    function deposit() public payable {
        
    }

    //the amount sent should be in wei 
    function send(address payable receiver, uint256 value) public restricted {
        receiver.transfer(value);
    }

    function getBalance() public view restricted returns ( uint256 ) {
        return address(this).balance;
    }
};
