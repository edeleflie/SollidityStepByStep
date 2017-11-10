pragma solidity ^0.4.0;

/* 
 * Here, we use a Solidity 'event'.
 * These events are very easy to program, and can be used to:
 * 1) let javascript GUI clients (or whoever) know that something has occured
 * 2) debugging an app
 *
 * Event logs are saved within the block chain.
 */

contract WishingWell {

    address private owner;
    uint commission_divisor = 100; 

    // publicise that an amount has been deposited to external listeners
    event LogDepositMade(address accountAddress, uint amount);

    function WishingWell() public {
        owner = msg.sender;
    }

    function deposit() if_right_amount() payable public returns (uint256){

        // calculate the commission, and send it to owner
        uint commission = msg.value / commission_divisor;
        owner.transfer(commission);

        // Trigger the event log
        LogDepositMade(msg.sender, msg.value - commission);

        return this.balance;
    }

    modifier if_right_amount() {
        uint right_amount = 100000000000000000; // 100 Finney
        require( msg.value == right_amount);
        _;
    }
}