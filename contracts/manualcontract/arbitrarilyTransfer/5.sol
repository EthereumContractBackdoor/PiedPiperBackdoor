/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/integer_overflow_and_underflow/integer_overflow_benign_1.sol
 * @author: -
 * @vulnerable_at_lines: 17
 */

//Single transaction overflow
//Post-transaction effect: overflow never escapes function

pragma solidity ^0.4.19;

contract IntegerOverflowBenign1 {
    uint public count = 1;

    function run(uint256 input) public {
        // <yes> <report> ARITHMETIC
        uint res = count - input;
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
