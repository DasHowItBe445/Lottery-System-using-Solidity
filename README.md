# Lottery System

This project implements a simple Ethereum-based Lottery System written in Solidity. Participants can enter the lottery by sending a fixed amount of Ether, and the manager can randomly pick a winner who receives the entire prize pool.


Overview:

The Lottery Smart Contract allows players to participate by sending 0.1 ETH.
Once a minimum of three players have entered, the manager can trigger the pickWinner() function, which randomly selects a winner using the block timestamp and randomness seed (block.prevrandao).

After a winner is chosen, the contract transfers the full balance to the winner’s wallet and resets the lottery for the next round.


Features:

Fixed Entry Fee: Each player must send exactly 0.1 ETH to join.

Manager Control: Only the contract manager can view the balance or pick a winner.

Random Winner Selection: Uses keccak256 hashing with block data for pseudorandomness.

Automatic Reset: After each round, the player list resets for a new lottery cycle.

Events: Emits logs when players enter and when a winner is picked.


Tech Stack:

-Solidity (v0.8.0)

-Remix IDE for contract deployment and interaction

-MetaMask for transaction signing and wallet management

-Sepolia Testnet for deployment and operational cost testing


How It Works:
 
 1] Deployment

- Open https://remix.ethereum.org/

- Create a new file named Lottery.sol and paste the contract code.

- Compile using Solidity Compiler v0.8.0 or above.

- Deploy using Injected Provider (MetaMask) to your desired network (e.g., Sepolia Testnet).


2] Participation

- Any user can enter the lottery by sending exactly 0.1 ETH to the contract.

- To enter using Remix:

Select your deployed contract.

Set value = 0.1 ether.

Click Transact (under the receive() function).
✅ You’ll see a PlayerEntered event in the Remix logs.


3] Checking Balance (Manager Only)

- The manager can view the total prize pool by calling:
  getBalance()
Returns the total ETH currently held in the contract.

4] Picking a Winner

- The manager triggers the winner selection by calling:
  pickWinner()

- Conditions:

At least 3 players must have entered.

The contract will:

Generate a pseudorandom number.

Select a winner from the player list.

Transfer all ETH to the winner.

Emit a WinnerPicked event.

5] Events

| Event                                          | Description                                             |
| ---------------------------------------------- | ------------------------------------------------------- |
| `PlayerEntered(address player)`                | Emitted when a player successfully enters the lottery   |
| `WinnerPicked(address winner, uint amountWon)` | Emitted when a winner is selected and awarded the prize |


Security Notes:

The randomness source (block.prevrandao, block.timestamp) is not cryptographically secure — use Chainlink VRF for true verifiable randomness in production.

Only the manager can access admin functions (getBalance, pickWinner).

For real deployments, consider gas optimizations and security audits.


Testing Environment:

You can test this contract using:

- Remix IDE (recommended for beginners).

- MetaMask connected to Sepolia Testnet.

- ETH Faucet for free test Ether: https://sepolia-faucet.pk910.de/


Example Run:

- 3+ players enter the lottery by sending 0.1 ETH each.

- Manager calls pickWinner().

- One player wins the entire pool (≈ 0.3 ETH).

- Contract resets player list for next round.


Future Enhancements:

-> Add frontend UI for easy participation via MetaMask.

-> Enable event logging for winner announcements.

-> Extend to multi-round automatic lotteries.
