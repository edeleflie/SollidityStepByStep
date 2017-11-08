pragma solidity ^0.4.0;

/* 
 * Here, we calculate a commission and send it back to the sender.
 */

contract WishingWell {
    mapping (address => uint) public balances;

    // this is the variable that will remember the owner
    address owner;

    // the commision rate .. is a divisor
    uint commission_divisor = 100; // this is equivalent to 1%

    // thic constructor makes the owner be the account who deployed the contract
    function WishingWell() public {
    	owner = msg.sender;
    }

    function deposit() payable public returns (uint256){

    	uint commission;

        require( msg.sender.balance >= msg.value);

        // calculate the commission, and send it to owner
        commission = msg.value / commission_divisor;
        owner.transfer(commission);

        // make sure we only remember real deposited amount
        balances[msg.sender] += msg.value - commission;

        return this.balance;
    }
}
