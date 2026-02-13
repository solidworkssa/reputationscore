// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ReputationScore Contract
/// @notice On-chain reputation tracking system.
contract ReputationScore {

    mapping(address => uint256) public scores;
    address public admin;
    
    constructor() {
        admin = msg.sender;
    }
    
    function updateScore(address _user, uint256 _score) external {
        require(msg.sender == admin, "Only admin");
        scores[_user] = _score;
    }

}
