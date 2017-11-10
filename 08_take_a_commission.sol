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

    address private owner;

    // the commision rate .. is a divisor
    // there are no floats in Ethereum (yet, apparently)
    uint commission_divisor = 100; // effectively 1%

    function WishingWell() public {
    	owner = msg.sender;
    }

    function deposit() if_right_amount() payable public returns (uint256){

        // calculate the commission, and send it to owner
        commission = msg.value / commission_divisor;
        owner.transfer(commission);

        return this.balance;
    }

    modifier if_right_amount() {
        uint right_amount = 100000000000000000; // 100 Finney
        require( msg.value == right_amount);
        _;
    }
}
