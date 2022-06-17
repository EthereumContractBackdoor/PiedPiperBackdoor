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
}
}
