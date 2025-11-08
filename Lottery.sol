// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address payable[] public players;
    address public manager;

    event PlayerEntered(address indexed player);
    event WinnerPicked(address indexed winner, uint amountWon);

    constructor() {
        manager = msg.sender;
    }

    modifier onlyManager() {
        require(msg.sender == manager, "Not Manager");
        _;
    }

    receive() external payable {
        require(msg.value == 0.1 ether, "Entry must be 0.1 ETH");
        players.push(payable(msg.sender));
        emit PlayerEntered(msg.sender);
    }

    function getBalance() public view onlyManager returns (uint) {
        return address(this).balance;
    }

    function random() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }

    function pickWinner() public onlyManager {
        require(players.length >= 3, "At least 3 players required");

        uint r = random();
        uint index = r % players.length;
        address payable winner = players[index];

        uint prizeAmount = getBalance();
        winner.transfer(prizeAmount);

        emit WinnerPicked(winner, prizeAmount);
        players = new address payable[](10); 
    }
}
