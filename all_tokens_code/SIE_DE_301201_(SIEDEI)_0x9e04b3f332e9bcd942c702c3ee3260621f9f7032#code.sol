//token_name	SIE_DE_301201_(SIEDEI)
//token_url	https://etherscan.io//address/0x9e04b3f332e9bcd942c702c3ee3260621f9f7032#code
//spider_time	2018/07/08 11:51:39
//token_Transactions	3 txns
//token_price	

pragma solidity 		^0.4.21	;						
									
contract	SIE_DE_301201				{				
									
	mapping (address => uint256) public balanceOf;								
									
	string	public		name =	"	SIE_DE_301201		"	;
	string	public		symbol =	"	SIEDEI		"	;
	uint8	public		decimals =		18			;
									
	uint256 public totalSupply =		11152804680322700000000000					;	
									
	event Transfer(address indexed from, address indexed to, uint256 value);								
									
	function SimpleERC20Token() public {								
		balanceOf[msg.sender] = totalSupply;							
		emit Transfer(address(0), msg.sender, totalSupply);							
	}								
									
	function transfer(address to, uint256 value) public returns (bool success) {								
		require(balanceOf[msg.sender] >= value);							
									
		balanceOf[msg.sender] -= value;  // deduct from sender's balance							
		balanceOf[to] += value;          // add to recipient's balance							
		emit Transfer(msg.sender, to, value);							
		return true;							
	}								
									
	event Approval(address indexed owner, address indexed spender, uint256 value);								
									
	mapping(address => mapping(address => uint256)) public allowance;								
									
	function approve(address spender, uint256 value)								
		public							
		returns (bool success)							
	{								
		allowance[msg.sender][spender] = value;							
		emit Approval(msg.sender, spender, value);							
		return true;							
	}								
									
	function transferFrom(address from, address to, uint256 value)								
		public							
		returns (bool success)							
	{								
		require(value <= balanceOf[from]);							
		require(value <= allowance[from][msg.sender]);							
									
		balanceOf[from] -= value;							
		balanceOf[to] += value;							
		allowance[from][msg.sender] -= value;							
		emit Transfer(from, to, value);							
		return true;							
	}								
}