pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol"; 

// lvl 1: equal split
contract AssociateProfitSplitter {
    using SafeMath for uint;
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    uint public balanceContract;
    // uint amount; // With this added, the lvalue error appears again...
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit(address payable recipient) public payable { 
        // Should be recipient, employees are going to receive the payment(s)
        if (recipient == employee_one || recipient == employee_two || recipient == employee_three) { // @TODO: Split `msg.value` into three
        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // Would I need to make a function to convert msg.sender to a lvalue?
        
        uint amount = (msg.value).div(3); // Don't add uint amount into the function parameters -> ()
        
        msg.sender.transfer((msg.value).sub(amount.mul(3))); // msg.sender should be using .transfer()

        // @TODO: Transfer the amount to each employee
        recipient.transfer(amount);
        // Assuming this needs to be done after all recipient transfers
        balanceContract = address(this).balance; 
        }        
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        balanceContract = address(this).balance; 
    }
}
