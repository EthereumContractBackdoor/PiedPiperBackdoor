/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/integer_overflow_and_underflow/integer_overflow_mapping_sym_1.sol
 * @author: -
 * @vulnerable_at_lines: 16
 */

//Single transaction overflow

pragma solidity ^0.4.11;

contract IntegerOverflowMappingSym1 {
    mapping(uint256 => uint256) map;

    function init(uint256 k, uint256 v) public {
        // <yes> <report> ARITHMETIC
        map[k] -= v;
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
