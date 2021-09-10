pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol"; 

// lvl 2: tiered split
contract TieredProfitSplitter {
    using SafeMath for uint;
    address payable employee_one; // ceo
    address payable employee_two; // cto
    address payable employee_three; // bob
    uint public balanceContract; 

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = (msg.value).div(100); // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // @TODO: Calculate and transfer the distribution percentage
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        amount = points.mul(60);
        // Step 2: Add the `amount` to `total` to keep a running total
        total = total.add(amount);
        // Step 3: Transfer the `amount` to the employee
        employee_one.transfer(amount);
        balanceContract = address(this).balance;
        // @TODO: Repeat the previous steps for `employee_two` and `employee_three`
        // Steps for the CTO
        amount = points.mul(25);
        total = total.add(amount);
        employee_two.transfer(amount);
        balanceContract = address(this).balance;
        
        // Steps for Bob
        amount = points.mul(15);
        total = total.add(amount);
        employee_three.transfer(amount);
        balanceContract = address(this).balance;

        employee_one.transfer(msg.value.sub(total)); // ceo gets the remaining wei
        balanceContract = address(this).balance; // After each transfer
    }

    function() external payable {
        deposit(); // Would this be the same method of enforcing that the fallback function is called??
        balanceContract = address(this).balance;
    }
}