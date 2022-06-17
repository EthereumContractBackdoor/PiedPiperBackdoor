/*
 * @source: https://github.com/thec00n/smart-contract-honeypots/blob/master/CryptoRoulette.sol
 * @vulnerable_at_lines: 40,41,42
 */
pragma solidity ^0.4.19;

// CryptoRoulette
//
// Guess the number secretly stored in the blockchain and win the whole contract balance!
// A new number is randomly chosen after each try.
// https://www.reddit.com/r/ethdev/comments/7wp363/how_does_this_honeypot_work_it_seems_like_a/
// To play, call the play() method with the guessed number (1-20).  Bet price: 0.1 ether

contract CryptoRoulette {

    uint256 private secretNumber;
    uint256 public lastPlayed;
    uint256 public betPrice = 0.1 ether;
    address public ownerAddr;

    struct Game {
        address player;
        uint256 number;
    }
    Game[] public gamesPlayed;

    function CryptoRoulette() public {
        ownerAddr = msg.sender;
        shuffle();
    }

    function shuffle() internal {
        // randomly set secretNumber with a value between 1 and 20
        secretNumber = uint8(sha3(now, block.blockhash(block.number-1))) % 20 + 1;
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

    function play(uint256 number) payable public {
        require(msg.value >= betPrice && number <= 10);
        // <yes> <report> OTHER - uninitialized storage
        Game game; //Uninitialized storage pointer
        game.player = msg.sender;
        game.number = number;
        gamesPlayed.push(game);

        if (number == secretNumber) {
            // win!
            msg.sender.transfer(this.balance);
        }

        shuffle();
        lastPlayed = now;
    }

    function kill() public {
        if (msg.sender == ownerAddr && now > lastPlayed + 1 days) {
            suicide(msg.sender);
        }
    }

    function() public payable { }
}
