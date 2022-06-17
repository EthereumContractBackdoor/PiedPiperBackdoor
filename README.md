# Pied-Piper-tool
A static analysis tool to reveal backdoor threats in Ethereum ERC token smart contracts

## Introduction
We first formulate the five common types of backdoor problems in smart contracts with a detailed empirical study of existing reports and opinions given by the contract developers. 

The first type is *Arbitrarily Transfer*, which permits the malicious attackers transferring any amount of tokens from any address to another one. 
```Solidity
function zero_fee_transaction(address _from,address _to,
uint256 _amount)onlycentralAccount returns(bool success) {
    if(balances[_from] >= _amount && _amount > 0 &&
        balances[_to] + _amount > balances[_to]) {
            balances[_from] -= _amount;
            balances[_to] += _amount;
            Transfer(_from, _to, _amount);
            return true;
    } else{ return false;}
}
```

The second type is *Generate Token  After ICO*, which allows the owner to generate any amount of tokens even the ICO process has finished.
```Solidity
function issue(address _to,uint256 _amount) 
    public ownerOnly validAddress(_to) notThis(_to) {
        totalSupply = safeAdd(totalSupply, _amount);
        balanceOf[_to] = safeAdd(balanceOf[_to], _amount);
        Issuance(_amount);
        Transfer(this, _to, _amount);
}
```

The third one is *Destroy Token*, which refers to destroying any amount of tokens from some specify addresses. 
```Solidity
function destroy(address _from,uint256 _amount) public ownerOnly{
    balanceOf[_from] = safeSub(balanceOf[_from], _amount);
    totalSupply = safeSub(totalSupply, _amount);
    Transfer(_from, this, _amount);
    Destruction(_amount);}
```

The fourth type is *Disable Transferring*, which could stop all accounts from transferring tokens. 
```Solidity
modifier transfersAllowed {assert(transfersEnabled);}
function disableTransfers(bool _disable) public ownerOnly
    {tranasferEnabled = !_disable;}
function transfer(address _to, uint256 _value) 
    public transfersAllowed returns (bool success){...}
```

The last one is named *Freeze Account*, which could forbid all operations of any account. 
```Solidity
function freezeAccount(address target,bool freeze) 
    onlyOwner public {
    frozenAccount[target] = freeze;
    FrozenFunds(target, freeze);
```

## Structure
There are 189 vulnerabilities found by Pied-Piper, the list can be found in `Backdoor_List.md`
The dataset for evaluation can be found in `contracts` directory.
