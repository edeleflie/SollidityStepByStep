pragma solidity ^0.4.0;

/* 
 * After each deposit, we tell the sender how much money is in this contract.
 */

contract WishingWell {
    mapping (address => uint) public balances;

    function deposit() payable public returns (uint256){

    	require( msg.sender.balance >= msg.value);

        balances[msg.sender] += msg.value;

        return this.balance;
    }
}

