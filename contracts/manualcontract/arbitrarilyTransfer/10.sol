/*
 * @source: https://github.com/ConsenSys/evm-analyzer-benchmark-suite
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 22
 */

//Multi-transactional, single function
//Arithmetic instruction reachable

pragma solidity ^0.4.23;

contract IntegerOverflowMultiTxOneFuncFeasible {
    uint256 private initialized = 0;
    uint256 public count = 1;

    function run(uint256 input) public {
        if (initialized == 0) {
            initialized = 1;
            return;
        }
        // <yes> <report> ARITHMETIC
        count -= input;
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
