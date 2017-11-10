pragma solidity ^0.4.0;

/* 
 * Here, we check the amount that has been sent, to make sure it is the right amount.
 *
 * Note the use of the 'if' command.
 *
 */

contract WishingWell {

    function deposit() payable public returns (uint256){

        // the fixed amount we would like to ensure: 1 Finney
        uint _amount = 1000000000000000;

        // Check that the amount sent is the same as the fixed amount
        // if it isnt, throw the transaction out the window
        if (msg.value != _amount) {
            throw;  // Note: this command is now deprecated, see next example for how to better do this
        }

        return this.balance;
    }
}
