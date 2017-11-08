pragma solidity ^0.4.0;

/* 
 * You don't have to save who sent what to the contract, 
 * but in many instances, it is a good idea.
 */

contract WishingWell {
    mapping (address => uint) public balances;

    function deposit() payable public {

        // Make sure we check if there's enough cash ... 
        // Otherwise we might 'remember' an amount that is wrong
        require( msg.sender.balance >= msg.value);

        // Save amount deposited to our balances hashmap
        balances[msg.sender] += msg.value;

        // if the sender did not have enough money in their account
        // and we didn't include the 'require' command above then
        // here (at the end of the deposit() function) is where
        // the code would stop.
        // i.e. everything before this would be executed.
        // and this would mean that in our 'balances' hashmap, we would
        // have asved a transfer amount that didn't occur.
    }
}

