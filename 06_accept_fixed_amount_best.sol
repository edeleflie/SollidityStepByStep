pragma solidity ^0.4.0;

/* 
 * The right way to check that a paid amount is an exact amount is to 
 * adhere to the principles of CONDITION-ORIENTED-PROGRAMMING
 *
 * See this blog post: https://medium.com/@gavofyork/condition-orientated-programming-969f6ba0161a
 *
 * In COP (a subset of Contract Oriented Programming) transactions should avoid
 * any conditional logic. It is recommended paractice to separate 
 * state changes from conditional checks.
 *
 * To do that, we can use Solidity's function modifiers.
 *
 */

contract WishingWell {

    function deposit() if_right_amount() payable public returns (uint256){
        return this.balance;
    }

    // This is a function modifier. It allows us to separate out
    // conditional code, so that the transaction function above is totally
    // clear of any possible forks.
    modifier if_right_amount() {
        uint right_amount = 100000000000000000; // 100 Finney
        require( msg.value == right_amount);
        _;
    }

}
