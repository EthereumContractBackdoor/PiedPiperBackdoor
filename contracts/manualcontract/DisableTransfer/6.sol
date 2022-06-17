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
}
