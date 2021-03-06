pragma solidity ^0.4.0;

/* 
 * You don't have to save who sent what to the contract, 
 * but in many instances, it is useful.
 *
 * For example, if you want your contract to behave like a bank,
 * your bank will only have one bottom line ... and how that bottom
 * line should be split up into different accounts would be determined 
 * by some values (just numbers) stored in the contract.
 *
 * This is also what 'tokens' are ... they are not a new data type in Ethereum,
 * they are just a bunch of numbers held inside a contract. It would thus be 
 * easy to accidently create a bad 'token' contract, where those numbers are 
 * accidently handled in ways not comensurate with securely traded currency. 
 * The DAO incident (https://en.wikipedia.org/wiki/The_DAO_(organization)), which
 * resulted in the first Ethereum fork, concerned an exploit of a contract dealing with tokens.
 *
 * Note the use of the require() command ... it is very easy to stop the transaction
 * at any time and for any reason. The expression contained within the require brackets
 * simply needs to retrun false.
 *
 * When an account is allocated tokens, those tokens dont sit in that account (like Ether).
 * Intead, the original contract holds those tokens on behalf of the account. So owning a token
 * is very different to owning Ether.
 *
 */

contract ArtBank {
    mapping (address => uint) public balances;

    function deposit() payable public {

        // Make sure we check if there's enough cash ... 
        // Otherwise we might 'remember' an amount that is wrong
        // this require() function stops any further processing and reverts
        // any trasactions if its contents resolve to false.
        require( msg.sender.balance >= msg.value);

        // Save amount deposited to our balances hashmap
        // This is NOT to be confused with Ether ... this 
        // balances hash (which you often see in sample contracts)
        // is just a way to remember, internally to the contract, who
        // has deposited how much
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

