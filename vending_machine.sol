//SPDX-License-Identifier: MIT

pragma solidity <0.9.0;

contract Vendingmachine{

    address public owner;

    constructor(){
        owner = msg.sender;
        _donutstock[address(this)] = 200;
    }

    mapping(address => uint) public _donutstock;

    function VendingMac_bal() public view returns(uint) {
        return _donutstock[address(this)];
    }

    function purchase(uint _stock) public{
        _donutstock[address(this)] -= _stock;
        _donutstock[msg.sender] += _stock;
    }

    function restock(uint _stock) public{
        require(msg.sender == owner , "Only owner can restock");
        _donutstock[address(this)] += _stock;
    }
}
