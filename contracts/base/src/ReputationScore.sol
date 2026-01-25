// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReputationScore {
    mapping(address => uint256) public scores;
    mapping(address => mapping(address => bool)) public hasRated;

    event ScoreUpdated(address indexed user, uint256 newScore);
    event RatingGiven(address indexed rater, address indexed rated, uint256 points);

    function rateUser(address user, uint256 points) external {
        require(!hasRated[msg.sender][user], "Already rated");
        require(points <= 5, "Max 5 points");

        scores[user] += points;
        hasRated[msg.sender][user] = true;
        emit RatingGiven(msg.sender, user, points);
        emit ScoreUpdated(user, scores[user]);
    }

    function getScore(address user) external view returns (uint256) {
        return scores[user];
    }
}
