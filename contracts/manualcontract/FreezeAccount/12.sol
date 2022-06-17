/*
 * @source: https://github.com/ConsenSys/evm-analyzer-benchmark-suite
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 18,24,30,36,42,48
 */

//Single transaction overflow
//Post-transaction effect: overflow escapes to publicly-readable storage

pragma solidity ^0.4.23;

contract IntegerOverflowSingleTransaction {
    uint public count = 1;

    // ADD overflow with result stored in state variable.
    function overflowaddtostate(uint256 input) public {
        // <yes> <report> ARITHMETIC
        count += input;
    }

    // MUL overflow with result stored in state variable.
    function overflowmultostate(uint256 input) public {
        // <yes> <report> ARITHMETIC
        count *= input;
    }

    // Underflow with result stored in state variable.
    function underflowtostate(uint256 input) public {
        // <yes> <report> ARITHMETIC
        count -= input;
    }

    // ADD Overflow, no effect on state.
    function overflowlocalonly(uint256 input) public {
        // <yes> <report> ARITHMETIC
        uint res = count + input;
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

    // MUL Overflow, no effect on state.
    function overflowmulocalonly(uint256 input) public {
        // <yes> <report> ARITHMETIC
        uint res = count * input;
    }

    // Underflow, no effect on state.
    function underflowlocalonly(uint256 input) public {
        // <yes> <report> ARITHMETIC
       	uint res = count - input;
    }

}
