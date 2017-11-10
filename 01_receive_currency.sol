pragma solidity ^0.4.0;

/* 
 * To send Ether to a contract only requires making a function 'payable'
 *
 * It is the sender who decides who much Ether is sent.
 * If using a Javascript client, this is what the call to deposit might look like:
 * 
 * wishingWellContract.deposit({from: eth.accounts[0], value: web3.toWei(1.0, "ether")});
 *
 * In other words, it is the sender who chooses how much to send, not the contract.
 */

contract WishingWell {

    function deposit() payable public {
    }
}
