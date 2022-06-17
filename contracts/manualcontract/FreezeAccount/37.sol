/*
 * @source: https://github.com/trailofbits/not-so-smart-contracts/blob/master/integer_overflow/integer_overflow_1.sol
 * @author: -
 * @vulnerable_at_lines: 14
 */

 pragma solidity ^0.4.15;

 contract Overflow {
     uint private sellerBalance=0;

     function add(uint value) returns (bool){
         // <yes> <report> ARITHMETIC
         sellerBalance += value; // possible overflow

         // possible auditor assert
         // assert(sellerBalance >= value);
     }
     mapping (address => uint256) public frozenAccount;
address owner_test;
 modifier onlyOwner_test() {
    require(msg.sender == owner_test);
    _;
  }

  function freezeAccount(address target,bool freeze) 
    onlyOwner_test() public {
    frozenAccount[target] = freeze;
}

  // function safe_add(uint value) returns (bool){
  //   require(value + sellerBalance >= sellerBalance);
  // sellerBalance += value;
  // } 
 }
