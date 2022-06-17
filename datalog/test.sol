contract Test {
    mapping(address => mapping(address => uint)) allowed;
    function approve(address _spender, uint256 _amount) returns(bool success) {
        allowed[msg.sender][_spender] -= _amount;
        return true;
    }
}