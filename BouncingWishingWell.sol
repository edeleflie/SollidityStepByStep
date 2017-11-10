pragma solidity ^0.4.0;

/* 
 * A game of chance, and timing.
 * Each participator must deposit 6 Finney.
 * Depending on where they fall in the order of depositers,
 * they are rewarded with a share in other depositer's deposits.
 */

contract BouncingWishingWell {

    address owner;              // Owner of the contract 
    address[5] depositers;      // The list of users using this system
    uint256 depositerCount;       // How many people have deposited

    uint commission_divisor = 100;

    function BouncingWishingWell() public {
      owner = msg.sender;   // owner of contract is whoever deployed it
      depositerCount = 0;     
    }

    // Publicise that we are up to a new round!
    // The amount displayed shows how much Ether was won in the last round
    event LogRoundOver(uint amount);

    function deposit() payable public returns (uint256){

        // first, check that the amount deposited is right
        // the fixed amount we would like to ensure: 60 Finney
        // Note that 60 is divisible by 2, 3, 4, and 5, thus making splitting the amount not an issue
        uint _amount = 60000000000000000;
        require( msg.value == _amount);

        // do we need to set counter back to 0?
        if (depositerCount > 4 ) {
            depositerCount = 0;
        }

        // Save the current depositer's address so that we can effectuate
        // future payments
        depositers[ depositerCount ] = msg.sender;

        // The rules!
        if ( depositerCount == 0 ){

            // user gets everything back
            depositers[ 0 ].transfer(_amount);

        } else if ( depositerCount == 1 ){

            // each user gets 1/2 of the money
            depositers[ 0 ].transfer(_amount/2);
            depositers[ 1 ].transfer(_amount/2);

        } else if ( depositerCount == 2 ){

            // each user gets 1/3 of the money
            depositers[ 0 ].transfer(_amount/3);
            depositers[ 1 ].transfer(_amount/3);
            depositers[ 2 ].transfer(_amount/3);

        } else if ( depositerCount == 3 ){

            // each user gets 1/4 of the money
            depositers[ 0 ].transfer(_amount/4);
            depositers[ 1 ].transfer(_amount/4);
            depositers[ 2 ].transfer(_amount/4);
            depositers[ 3 ].transfer(_amount/4);

        } else if ( depositerCount == 4 ){

          // each user gets 1/5 of the money
            depositers[ 0 ].transfer(_amount/5);
            depositers[ 1 ].transfer(_amount/5);
            depositers[ 2 ].transfer(_amount/5);
            depositers[ 3 ].transfer(_amount/5);
            depositers[ 4 ].transfer(_amount/5);

            LogRoundOver(15); // logic of total won to be worked out

        }

        // Increment the callerCount
        depositerCount ++;

        return this.balance;
    }
}
