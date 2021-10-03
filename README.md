## Process for each contract

Testnet address for AssociateProfitSplitter.sol:''

Testnet address for TieredProfitSplitter.sol:''

### Level One Contract (AssociateProfitSplitter.sol)
Motivation:
To ease the burden on the Human Resources department of the company, automating the accounting and auditing process gives us the ability to make it easier to execute the payment of workers. Also, in doing so through the execution of smart contracts on a blockchain, there's increased transparency. This contract will send evenly split payments to different associate level employees. 

How The Contract Works: 
After the employee addresses have been set for each as an address payable, we need to ensure that the balance of the contract can update, so this is done with a function balance() that will be able to return what the updated amount is. Afterwards, there's a deposit function created so funds can be sent into the contract. However, to make sure that the deposit function works properly, a fallback function has been added into the contract to prevent ETH from being locked in the contract since there's no withdraw.

### Level Two Contract (TieredProfitSplitter.sol)
Motivation:
A similar motivation as the AssociateProfitSplitter.sol can be said for this contract, except for who the funds will be distributed to. The ETH will be allocated based on the tiers of employees with three different tiers.

How the Contract Works:
Up until the deposit function, this contract works in the same fashion as the AssociateProfitSplitter contract. Within the deposit() function though, there's an unsigned integer variable named 'points', which will be equal to the msg.value / 100 in order to calculate the rudimentary percentage. After this has been done, adding two other unsigned integers will be needed, which are amount, for the amount an employee will receive based on their tier, and total, which wil be used to count the amount after each distribution. With these functions created, now occurs a repeated process of setting the amount equal to however many points multiplied by the percentage points. Following each line dedicated to a certain amount for a tier level employee, total will add in the most recent amount used to keep a running total. Once these steps have been written out for employee one, which is the CEO who will receive 60%, these steps will be similarly written out for the second and third employee. In the event that there's spare wei in the contract, this wei will be sent to the CEO. 

###### Images for Level Two Contract 
![Screenshot of Funds Sent to Accounts](https://user-images.githubusercontent.com/68878624/132764912-57206682-4b03-4930-b804-93941c9f21de.png)

![Screenshot of Accounts Added into Contract on Remix IDE](https://user-images.githubusercontent.com/68878624/132765030-db0b855b-45e2-47d2-bd15-ec49b4e31c25.png)
