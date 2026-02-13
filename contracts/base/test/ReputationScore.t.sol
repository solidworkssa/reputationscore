// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/ReputationScore.sol";

contract ReputationScoreTest is Test {
    ReputationScore public c;
    
    function setUp() public {
        c = new ReputationScore();
    }

    function testDeployment() public {
        assertTrue(address(c) != address(0));
    }
}
