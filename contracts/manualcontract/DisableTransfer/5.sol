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
