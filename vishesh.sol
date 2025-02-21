// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIPrediction {
    address public owner;
    string public latestTrend;
    uint256 public lastUpdated;

    mapping(uint256 => string) public predictions;
    uint256 public predictionCount;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function updatePrediction(string memory _trend) public onlyOwner {
        latestTrend = _trend;
        lastUpdated = block.timestamp;
        predictions[predictionCount] = _trend;
        predictionCount++;
    }

    function getLatestPrediction() public view returns (string memory, uint256) {
        return (latestTrend, lastUpdated);
    }
}
