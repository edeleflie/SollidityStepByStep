pragma solidity ^0.4.0;

/* 
 * Here, we calculate a commission and send it to the contract owner.
 * we also make sure that the local balance (which is not Ether, it is just a log)
 * records the right amount (deposit less commission)
 *
 * Note: To mover Ether from the contract account to a user account
 * the function 'transfer' is recommended over the older 'send' because of
 * issues with propagating errors in the older 'send' implementation.
 *
 */

contract WishingWell {
    mapping (address => uint) public balances;

    address owner;

    // the commision rate .. is a divisor
    // there are no floats in Ethereum (yet, apparently)
    uint commission_divisor = 100; // effectively 1%

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
