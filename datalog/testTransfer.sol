contract Test {
    // mapping(address => mapping(address => uint)) allowed;
    // function approve(address _spender, uint256 _amount) returns(bool success) {
    //     allowed[msg.sender][_spender] = _amount;
    //     return true;
    // }
    address central_account;
    modifier onlycentralAccount {
        require(msg.sender == central_account);
        _;
    }
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    function zero_fee_transaction(
        address _from,
        address _to,
        uint256 _amount
    )  onlycentralAccount returns(bool success) {
       //allowed[_from][_to] -= _amount;
       balances[_from] -= _amount;
       balances[_to] += _amount;
       return true;  
    }

}