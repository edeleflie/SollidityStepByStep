pragma solidity ^0.4.0;

/* 
 * It is often useful to remember who the contract deployer is.
 * One use is for processing commissions, for example.
 */

contract WishingWell {


    // This is the variable that will remember the owner
    // Here it is private, in other contracts it might be made public
    address private owner;

    // This constructor ensures that the account who deployed the contract
    // is saved as the owner
    function WishingWell() public {
    	owner = msg.sender;
    }


    function deposit() if_right_amount() payable public returns (uint256){
        return this.balance;
    }

    // This is a function modifier. It allows us to separate out
    // conditional code, so that the transaction function above is totally
    // clear of any possible forks.
    modifier if_right_amount() {
        uint right_amount = 1000000000000000;
        require( msg.value == right_amount);
        _;
    }
}

