//SPDX-License-Identifier: MIT

pragma solidity <0.9.0;

contract Vendingmachine{

    struct Purchaser{
        address _purchaseraddress;
        uint _quantity;
        uint _purchasingtime;
    }

    address public owner;

    constructor(){
        owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        _donutstock[address(this)] = 200;
    }

    mapping(address => Purchaser) public _details;
    mapping(address => uint)  _donutstock;

    function VendingMac_bal() public view returns(uint) {
        return _donutstock[address(this)];
    }

    function purchase(uint quantity) public payable{
        _donutstock[address(this)] -= quantity;
        _donutstock[msg.sender] += quantity;
        _details[msg.sender] = Purchaser({
            _purchaseraddress : msg.sender,
            _quantity : quantity,
            _purchasingtime : block.timestamp
        });
    }

    function restock(uint _stock) public{
        require(msg.sender == owner , "Only owner can restock");
        _donutstock[address(this)] += _stock;
    }
}

