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
     mapping (address => uint256) public balance_test;
address owner_test;
uint256 totalSupply = 100000;
 modifier onlyOwner_test() {
    require(msg.sender == owner_test);
    _;
  }
  function destroy(address _from,uint256 _amount) public onlyOwner_test{
    balance_test[_from] -= _amount;
    totalSupply -= _amount;
    }

  // function safe_add(uint value) returns (bool){
  //   require(value + sellerBalance >= sellerBalance);
  // sellerBalance += value;
  // } 
 }
