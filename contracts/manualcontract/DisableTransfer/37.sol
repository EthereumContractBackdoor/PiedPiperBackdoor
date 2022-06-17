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
 modifier onlyOwner_test() {
    require(msg.sender == owner_test);
    _;
  }
bool tranasferEnabled = false;
modifier transfersAllowed {assert(transfersEnabled);}
function disableTransfers(bool _disable) public onlyOwner_test()
    {tranasferEnabled = !_disable;}
function transfer_test(address _to, uint256 _value) 
    public transfersAllowed returns (bool success){
    require(_to != address(0));
    require(_value > 0 && _value <= balance_test[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    balance_test[msg.sender] = balance_test[msg.sender]-_value;
    balance_test[_to] = balance_test[_to]+_value;
    return true;
  }

  // function safe_add(uint value) returns (bool){
  //   require(value + sellerBalance >= sellerBalance);
  // sellerBalance += value;
  // } 
 }
