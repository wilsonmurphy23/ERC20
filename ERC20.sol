// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20{
event Transfer (address indexed from, address indexed to, uint );
event Approval (address indexed owner, address indexed spender, uint256 value);

    string constant public name = "wilToken";
    string constant public symbol = "WMM";
    uint constant public decimals = 18;


    uint public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

function transfer(address to, uint256 value) external returns (bool){
    return _transfer(msg.sender, to, value);
    }

function transferFrom(address from, address to, uint256 value) external returns (bool){
    require(allowance[from][msg.sender] >= value, "ERC20: insufficient allowance");

    allowance[from][msg.sender] -= value;

    emit Approval(from, msg.sender, allowance[from][msg.sender]);

    return _transfer(from, to, value);
}
function approve(address spender, uint256 value) external returns (bool){
    allowance[msg.sender][spender]+=value;
    emit Approval(msg.sender, spender, value);

    return true;
}
function _transfer(address from, address to, uint256 value) public returns (bool){
    require(balanceOf[msg.sender] >= value, "ERC20: insufficient sender balance");
    emit Transfer(from, to, value);
    balanceOf[from] -= value;
    balanceOf[to] += value;

    return true;
}
function giveMeOneToken () external {
    balanceOf[msg.sender] += 1e18;
}


}