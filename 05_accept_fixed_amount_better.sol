pragma solidity ^0.4.0;

/* 
 * Syntactically, instead of using the if command, we can use the command
 * 'require' to satisfy the condition.
 *
 *
 */

contract WishingWell {
    mapping (address => uint) public balances;

    function deposit() payable public returns (uint256){

        // the fixed amount we would like to ensure: 1 Finney
        uint _amount = 1000000000000000;

        // Check that the amount sent is the same as the fixed amount
        require( msg.value == _amount);

        // check that there is enough Ether in the sender's account
        require( msg.sender.balance >= _amount);

        // remember it for future reference
        balances[msg.sender] += _amount;

        return this.balance;
    }
}
