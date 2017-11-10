pragma solidity ^0.4.0;

/* 
 * Syntactically, instead of using the if command, we can use the command
 * 'require' to satisfy the condition.
 *
 *
 */

contract WishingWell {

    function deposit() payable public returns (uint256){

        // the fixed amount we would like to ensure: 100 Finney (about $30)
        uint _amount = 100000000000000000;

        // Check that the amount sent is the same as the fixed amount
        require( msg.value == _amount);

        return this.balance;
    }
}
