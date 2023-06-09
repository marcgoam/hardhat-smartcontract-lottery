// Raffle

// Enter the lottery (paying some amount)
// Pick a random winner (ChainLink randomness)
// Winner to be selected every X minutes -> completly automated
// ChainLink oracle -> Randomness, Automated execution (Chainlink Keepers)

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

error Raffle__NotEnoughtETHEntered();

contract Raffle {
    /* State Variables */
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughtETHEntered();
        }
        s_players.push(payable(msg.sender));
    }

    // function pickRandomWinner(){}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
