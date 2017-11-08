pragma solidity ^0.4.0;

contract WishingWell {
    mapping (address => uint) public balances;

    // this is the variable that will remember the owner
    address owner;

    // thic constructor makes the owner be the account who deployed the contract
    function WishingWell() public {
    	owner = msg.sender;
    }

    function deposit() payable public returns (uint256){

        require( msg.sender.balance >= msg.value);

        // remember it for future reference
        balances[msg.sender] += msg.value;

        return this.balance;
    }
}
