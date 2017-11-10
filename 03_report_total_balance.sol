pragma solidity ^0.4.0;

/* 
 * We are not making a token, so we can remove the unecessary 'balances' variable
 * 
 * After each deposit, we tell the sender how much Ether is in this wishing well.
 *
 * Functions can return values.
 *
 */

contract WishingWell {


    function deposit() payable public returns (uint256){

        return this.balance;

    }
}

