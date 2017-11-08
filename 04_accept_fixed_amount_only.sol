pragma solidity ^0.4.0;

/* 
 * Here, we check the amount that has been sent, to make sure it is the right amount
 */

contract WishingWell {
    mapping (address => uint) public balances;

    function deposit() payable public returns (uint256){

        // the fixed amount we would like to ensure: 1 Finney
        uint _amount == 1000000000000000;

        // Check that the amount sent is the right amount
        require( msg.value == _amount);

        // check that it is enough
        require( msg.sender.balance >= _amount);

        // remember it for future reference
        balances[msg.sender] += _amount;

        return this.balance;
    }
}
