//token_name	CERTI-A_SingleSource_(CERTI-A)
//token_url	https://etherscan.io//address/0xd4fffa07929b1901fdb30c1c67f80e1185d4210f#code
//spider_time	2018/07/08 12:39:01
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.15;

contract SafeMath {
    function safeSub(uint a, uint b) pure internal returns (uint) {
        assert(b <= a);
        return a - b;
    }

    function safeAdd(uint a, uint b) pure internal returns (uint) {
        uint c = a + b;
        assert(c >= a && c >= b);
        return c;
    }
}


contract ERC20 {
    uint public totalSupply;
    function balanceOf(address who) public constant returns (uint);
    function allowance(address owner, address spender) public constant returns (uint);
    function transfer(address toAddress, uint value) public returns (bool ok);
    function transferFrom(address fromAddress, address toAddress, uint value) public returns (bool ok);
    function approve(address spender, uint value) public returns (bool ok);
    event Transfer(address indexed fromAddress, address indexed toAddress, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}


contract StandardToken is ERC20, SafeMath {
    mapping (address => uint) balances;
    mapping (address => mapping (address => uint)) allowed;

    function transfer(address _to, uint _value) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        var _allowance = allowed[_from][msg.sender];

        balances[_to] = safeAdd(balances[_to], _value);
        balances[_from] = safeSub(balances[_from], _value);
        allowed[_from][msg.sender] = safeSub(_allowance, _value);
        Transfer(_from, _to, _value);
        return true;
    }

    function balanceOf(address _owner) public constant returns (uint balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public constant returns (uint remaining) {
        return allowed[_owner][_spender];
    }

}


contract CertiPreSaleToken is StandardToken {
    string public name = "CERTI-A SingleSource";
    string public symbol = "CERTI-A";
    uint public decimals = 18;
    uint public totalSupply = 131578948 ether;

    function CertiPreSaleToken() public {
        balances[msg.sender] = totalSupply;
    }
}