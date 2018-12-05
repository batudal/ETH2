pragma solidity ^0.4.2;

contract DappToken {
  // Constructor
  // Set the total number of tokens
  // Read the total number of tokens
  uint256 public totalSupply;
  string public name = "DApp Token";
  string public symbol = "DAPP";
  string public standard = "DApp Token v1.0";

  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  mapping (address => uint256) public balanceOf;

  function DappToken (uint256 _initialSupply) public {
    balanceOf[msg.sender] = _initialSupply;
    totalSupply = _initialSupply;
    // Allocate the initial supply
  }

  function transfer (address _to, uint256 _value) public returns (bool success) {
    require(balanceOf[msg.sender] >= _value);
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;

    Transfer(msg.sender, _to, _value);
    return true;
  }

}
