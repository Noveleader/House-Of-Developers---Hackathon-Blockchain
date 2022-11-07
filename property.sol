//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./price.sol";
error notOwner();
error noFurtherTransaction();

contract property {
    using price for uint256;
    address[] public seller;
    address public owner;
    address public buyers;
    uint256 public initialamount;
    uint256 public priceBySeller;
    uint256 public minamount;
    uint256 public lease;
    uint256 public minlease;
    uint256 public valueOffered;
    uint256 public valueOffered2;
    mapping(address => uint256) public sells;

    constructor() {
        seller = msg.sender; //The contract is called when the seller want to do any asset transaction of their physical property
        owner = seller;
    }

    modifier OnlyOwner() {
        if (msg.sender != owner) {
            revert notOwner();
        }
        _;
    }

    function add() public payable {
        //Helps to add the person into the ledger
        sells[msg.sender] = msg.value;
        seller.push(msg.sender);
    }

    function getTheLastOwner() external view returns (address) {
        uint lastIndex = seller.length - 1;
        return seller[lastIndex];
    }

    function getLengthArray() external view returns (uint) {
        return seller.length;
    }

    address public currentOwner = getTheLastOwner();

    function propertybuy() public payable {
        if (getConversionRate(msg.value) >= price) {
            //considering msg.value are in eth
            sells[currentOwner] = valueOffered;
            revert;
        } else {
            return propertyNegotiate();
        }
    }

    function propertyNegotiate() public payable {
        if (getConversionRate(msg.value) >= minamount) {
            sells[currentowner] = valueOffered2;
            revert;
        } else {
            return noFurtherTransaction();
        }
    }

    function propertyrent() public payable {
        if (getConversionRate(msg.value) >= lease) {
            sells[msg.sender] = msg.value;
            revert;
        } else {
            return noFurtherTransaction();
        }
    }
}
