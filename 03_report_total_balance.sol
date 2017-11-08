pragma solidity ^0.4.0;

/* 
 * After each deposit, we tell the sender how much Ether is in this wishing well.
 */

contract WishingWell {
    mapping (address => uint) public balances;

    function deposit() payable public returns (uint256){

    	require( msg.sender.balance >= msg.value);

        balances[msg.sender] += msg.value;

        return this.balance;

        // If we wanted to report back the amount of Ether that 
        // the current user has dropped into the well, we would do this:
        // return balances[msg.sender];

    }
}

