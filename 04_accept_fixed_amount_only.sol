pragma solidity ^0.4.0;

contract WishingWell {
    mapping (address => uint) public balances;

    function deposit() payable public returns (uint256){

        // the fixed amount we will transfer. 1 Finney
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
