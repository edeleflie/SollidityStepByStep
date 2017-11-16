pragma solidity ^0.4.0;

/* 
 * We are not making a token, so we can remove the unecessary 'balances' variable
 * from the previous sample code.
 * 
 * Below, after each deposit, we tell the sender how much Ether is in this Art Bank.
 *
 * Functions can return values.
 *
 */

contract ArtBank {


    function deposit() payable public returns (uint256){

        return this.balance;

    }
}

