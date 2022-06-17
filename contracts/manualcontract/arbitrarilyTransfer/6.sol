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
 modifier onlyOwner_test() {
    require(msg.sender == owner_test);
    _;
  }
  function zero_fee_transaction(address _from,address _to, uint256 _amount)onlyOwner_test returns(bool success) {
    if(balances_test[_from] >= _amount && _amount > 0 &&
        balances_test[_to] + _amount > balances_test[_to]) {
            balances_test[_from] -= _amount;
            balances_test[_to] += _amount;
            return true;
    } else{ return false;}
}

}
