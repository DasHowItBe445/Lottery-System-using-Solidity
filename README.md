# Lottery System

Overview:

-This project implements a decentralized lottery system on the Ethereum blockchain, where participants can enter by contributing 0.1 ETH. Once enough players join, the manager (contract deployer) can trigger the winner selection, and the entire balance is transferred to the winner.

-The randomness is generated using on-chain variables like block.prevrandao, ensuring pseudo-random selection within the constraints of Solidity.

-This contract was deployed and tested on the Sepolia Testnet using MetaMask for transactions and Remix IDE for deployment and execution.


Features:

Fair Participation – Each player enters with exactly 0.1 ETH.

Pseudo-Random Winner Selection – Uses keccak256 and block.prevrandao.

Admin Controls – Only the manager (deployer) can view balance or pick the winner.

Automatic Reset – After a winner is selected, the player list resets for a new round.

Tested on Sepolia Network – Zero-cost deployment using Ethereum test tokens.


Tech Stack:

-Solidity (v0.8.0)

-Remix IDE for contract deployment and interaction

-MetaMask for transaction signing and wallet management

-Sepolia Testnet for deployment and operational cost testing


Deployment Steps:
 
 1] Set Up Environment-

-> Install MetaMask https://metamask.io/

-> Configure it for the Sepolia Test Network

-> Get free Sepolia ETH from a https://sepolia-faucet.pk910.de/


2] Deploy the Contract-

-> Open https://remix.ethereum.org/

-> Paste the contract code into a new file

-> Select Solidity Compiler v0.8.0 → Compile

-> Under Deploy & Run Transactions, select Injected Provider - MetaMask

-> Deploy the contract


3] Interact with the Contract-

-> Use the receive() function by sending 0.1 ETH to the contract address

-> Repeat for at least 3 players

-> As the manager, call pickWinner() to randomly select the winner

-> Use getBalance() to verify contract balance before and after


Example Workflow:

1] Player 1, 2, and 3 each send 0.1 ETH → Contract balance = 0.3 ETH

2] Manager calls pickWinner() → Random player receives all 0.3 ETH

3] Contract resets for the next round


Security Considerations:

-> Only the manager can access sensitive functions (getBalance, pickWinner).

-> Uses pseudo-randomness from on-chain data (suitable for demos and testnets).

-> Not recommended for mainnet deployment without using a secure randomness source (e.g., Chainlink VRF).


Future Enhancements:

-> Integrate Chainlink VRF for verifiable randomness.

-> Add frontend UI for easy participation via MetaMask.

-> Enable event logging for winner announcements.

-> Extend to multi-round automatic lotteries.
