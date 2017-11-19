pragma solidity ^0.4.0;

/* 
 * A recommended pattern, when transferring Ether to other accounts, is  
 * the withdraw pattern.
 *
 * When effecting a transfer immediately after some logic has been executed
 * that trasnfer is open to be manipulated by another other contract that can 
 * work out how to manipulate that logic. Thus, it is considered safer for outputting
 * transactions to be explicitly called by the account the Ether is going to. This
 * is called the withdraw pattern.
 * 
 * The withdraw pattern uses a little more code overhead, since we have to remember
 * how much Ether is allowed to be withdrawn by the concerned account.
 * 
 */

contract ArtBank {

    address private owner;

    uint commission_divisor = 10; 
    // this variable remembers how much Ether has gone to commissions
    uint private commission_funds; 

    function ArtBank() public {
    	owner = msg.sender;
    	commission_funds = 0;
    }

    function deposit() payable public returns (uint256){
        uint commission = msg.value / commission_divisor;
        // Now, we dont actually transfer any cash, we just
        // remember how much of our Ether can be drained in commission
        commission_funds += commission;
        return this.balance;
    }

    // Here we must ensure that the person who attempts to withdraw the funds is 
    // indeed the creator of this account.
    function withdrawCommission() public {
    	require( msg.sender == owner);
    	owner.transfer(commission_funds);   // transfer money
        commission_funds = 0;               // register trasnferred funds as 0
    }

}