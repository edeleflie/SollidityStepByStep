pragma solidity ^0.4.0;

/* 
 * It is often useful to remember who the contract deployer is.
 * One use is for processing commissions, for example.
 */

contract WishingWell {
    mapping (address => uint) public balances;

    // this is the variable that will remember the owner
    address owner;

    // this constructor ensures that the account who deployed the contract
    // is saved as the owner
    function WishingWell() public {
    	owner = msg.sender;
    }

    function deposit() payable public returns (uint256){

        require( msg.sender.balance >= msg.value);

        balances[msg.sender] += msg.value;

        return this.balance;
    }
}
