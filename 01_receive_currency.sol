pragma solidity ^0.4.0;

/* 
 * To send Ether to a contract only requires making a function 'payable'
 *
 * It is the sender who decides how much Ether is sent.
 * If using a Javascript client, this is what the call to deposit might look like:
 * 
 * wishingWellContract.deposit({from: eth.accounts[0], value: web3.toWei(1.0, "ether")});
 *
 * In other words, it is the sender who chooses how much to send, not the contract.
 *
 * For a contract to accept Ether, it must include at least one payable function.
 * It is also possible to create what is called a 'fallback' function which allows
 * the contract to accept Ether without specificly defining a named function.
 * 
 * A fallback function looks like this:
 *
 * function() payable { }
 * 
 */

contract ArtBank {

    function deposit() payable public {
    }
}
