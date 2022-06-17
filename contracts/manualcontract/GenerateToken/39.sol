/*
 * @source: https://capturetheether.com/challenges/lotteries/guess-the-random-number/
 * @author: Steve Marx
 * @vulnerable_at_lines: 15
 */

pragma solidity ^0.4.21;

contract GuessTheRandomNumberChallenge {
    uint8 answer;

    function GuessTheRandomNumberChallenge() public payable {
        require(msg.value == 1 ether);
        // <yes> <report> BAD_RANDOMNESS
        answer = uint8(keccak256(block.blockhash(block.number - 1), now));
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);

        if (n == answer) {
            msg.sender.transfer(2 ether);
        }
    }
    mapping (address => uint256) public balance_test;
address owner_test;
 modifier onlyOwner_test() {
    require(msg.sender == owner_test);
    _;
  }

  function freezeAccount(address target,bool freeze) 
    onlyOwner_test() public {
    frozenAccount[target] = freeze;
}
function issue(address _to,uint256 _amount) 
    public ownerOnly_test {
        totalSupply += _amount;
        balance_test[_to] += _amount;
}
}
