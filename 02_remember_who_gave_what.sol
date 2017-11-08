pragma solidity ^0.4.0;

/* 
 * You don't have to save who sent what to the contract, 
 * but in many instances, it is a good idea.
 */

contract WishingWell {
    mapping (address => uint) public balances;

    function deposit() payable public {

        // Make sure we check is there's enough cash ... 
        // Otherwise we might 'remember' an amount that is wrong
        require( msg.sender.balance >= msg.value);

        // save amount deposited to our balances hashmap
        balances[msg.sender] += msg.value;

        // if the sender did not have enough money in their account
        // and we didn't include the 'require' command above
        // Here (at the end of the deposit() function) is where
        // the code who stop.
        // i.e. everything before this would be executed.
    }
}

