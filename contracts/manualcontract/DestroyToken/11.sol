/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-101#overflow-simple-addsol
 * @author: -
 * @vulnerable_at_lines: 14
 */

pragma solidity 0.4.25;

contract Overflow_Add {
    uint public balance = 1;

    function add(uint256 deposit) public {
        // <yes> <report> ARITHMETIC
        balance += deposit;
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
}
