pragma solidity ^0.4.0;

/* 
 * It is often useful to remember who the contract deployer is.
 * One use is for processing commissions, for example.
 */

contract ArtBank {

    // This is the variable that will remember the owner
    // Here it is private, in other contracts it might be made public
    address private owner;

    // This constructor ensures that the account who deployed the contract
    // is saved as the owner
    function ArtBank() public {
    	owner = msg.sender;
    }

    function deposit() if_right_amount() payable public returns (uint256){
        return this.balance;
    }

    modifier if_right_amount() {
        uint right_amount = 100000000000000000; // 100 Finney
        require( msg.value == right_amount);
        _;
    }
}

