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
    mapping (address => uint) public balances;
    address owner;
    uint commission_divisor = 100; 

    function WishingWell() public {
    	owner = msg.sender;
    }

    // publicise that an amount has been deposited to external listeners
    event LogDepositMade(address accountAddress, uint amount);

    function deposit() payable public returns (uint256){

    	uint commission;

        require( msg.sender.balance >= msg.value);
        commission = msg.value / commission_divisor;
        owner.transfer(commission);

        balances[msg.sender] += msg.value - commission;

        // Trigger the event log
        LogDepositMade(msg.sender, msg.value - commission);

        return this.balance;
    }
}
