
pragma solidity ^0.4.0;

/* 
 * One of the more common security vulnerabilities in Ethereum is known as the 
 * re-entrancy attack.
 *
 * Re-entrancy attacks usually occur when one contract calls another. This is 
 * because when one contract calls a second, that second contract then holds control
 * of the logic flow. 
 * 
 * To combat the re-entrancy risk, use the Checks-Effects-Interactions pattern
 * 
 * CHECKS EFFECTS INTERACTION patterm
 *
 * 
 *
 */

contract Fund {
    /// Mapping of ether shares of the contract.
    mapping(address => uint) shares;
    /// Withdraw your share.
    function withdraw() {
        var share = shares[msg.sender];
        require( share > 0 );       // CHECKS
        shares[msg.sender] = 0;     // EFFECT (on local state variables)
        msg.sender.transfer(share); // INTERACT (with other contracts)
    }
}

// NOT THIS

pragma solidity ^0.4.0;

// THIS CONTRACT CONTAINS A BUG - DO NOT USE
contract Fund {
    /// Mapping of ether shares of the contract.
    mapping(address => uint) shares;
    /// Withdraw your share.
    function withdraw() {
        if (msg.sender.send(shares[msg.sender]))
            shares[msg.sender] = 0;    // LOCAL STATE IS MODIFIED *AFTER* INTERACTION HAS OCCURRED
    }
}
