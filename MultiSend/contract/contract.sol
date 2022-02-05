// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract MultiSend {
    address payable manager;

    constructor() {
        manager = payable(msg.sender);
    }

    modifier restricted() {
        require( payable(msg.sender) == manager );
        _;
    }

    function deposit() public payable {}

    function send( uint amount, address payable[] memory receivers ) public payable restricted {
        for ( uint i = 0; i < receivers.length; i++) {
            receivers[i].transfer(amount);
        }
    }
}