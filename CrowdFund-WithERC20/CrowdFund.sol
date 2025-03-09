
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// Importing the IERC20 interface for interacting with ERC20 tokens
import "./IERC20.sol";

contract CrowdFund {
    // Immutable ERC20 token instance to be used for pledging
    IERC20 public immutable token;

    // Counter to keep track of the total number of campaigns created
    uint256 public campaignTotalCount;

    // Constructor to initialize the CrowdFund contract with the ERC20 token address
    constructor(address _token) {
        token = IERC20(_token);
    }

    // Struct to represent a Crowd Funding Campaign
    struct Campaign {
        address creator; // Address of the campaign creator
        uint256 goal; // Funding goal in tokens
        uint256 pledged; // Total amount of tokens pledged so far
        uint256 startAt; // Timestamp when the campaign starts
        uint256 endAt; // Timestamp when the campaign ends
        bool claimed; // Flag to check if the funds have been claimed by the creator
    }

    // Mapping to store all campaigns by their unique ID
    mapping(uint256 campaignId => Campaign) public campaigns;

    // Mapping to store the amount pledged by each address for a specific campaign
    mapping(uint256 campaignId => mapping(address pledger => uint256 amountOfPledge)) public pledgedAmount;

    // Function to launch a new campaign
    function launch(uint256 _goal, uint256 _startAt, uint256 _endAt) public {
        // Ensure the campaign start time is in the future
        require(_startAt >= block.timestamp, "Start time of the campaign can't be less than now!");
        // Ensure the campaign end time is after the start time
        require(_endAt > _startAt, "The ending time the campaign can't be less than starting time!");

        // Create a new campaign and store it in the campaigns mapping
        campaigns[campaignTotalCount] = Campaign({
            creator: msg.sender,
            goal: _goal,
            pledged: 0,
            startAt: _startAt,
            endAt: _endAt,
            claimed: false
        });

        // Increment the total campaign count
        campaignTotalCount++;
    }

    // Function to cancel a campaign before it starts
    function cancel(uint256 _campaignId) public {
        Campaign memory campaignTemp = campaigns[_campaignId];

        // Ensure only the creator can cancel the campaign
        require(campaignTemp.creator == msg.sender, "You are not a creator");
        // Ensure the campaign has not started yet
        require(block.timestamp < campaignTemp.startAt, "The campaign has started");

        // Delete the campaign from the mapping
        delete campaigns[_campaignId];
    }

    // Function to pledge tokens to a campaign
    function pledge(uint256 _campaignId, uint256 _amountOfPledge) public {
        Campaign storage tempCampaign = campaigns[_campaignId];

        // Ensure the campaign has started
        require(block.timestamp >= tempCampaign.startAt, "The campaign has not started");
        // Ensure the campaign has not ended
        require(block.timestamp <= tempCampaign.endAt, "The campaign was ended");

        // Update the total pledged amount for the campaign
        tempCampaign.pledged += _amountOfPledge;
        // Update the pledged amount for the sender
        pledgedAmount[_campaignId][msg.sender] += _amountOfPledge;
        // Transfer tokens from the sender to this contract
        token.transferFrom(msg.sender, address(this), _amountOfPledge);
    }

    // Function to unpledge tokens from a campaign
    function unpledge(uint256 _campaignId, uint256 _amountOfPledge) public {
        Campaign storage tempCampaign = campaigns[_campaignId];

        // Ensure the campaign has not ended
        require(block.timestamp <= tempCampaign.endAt, "The campaign ended");

        // Reduce the total pledged amount for the campaign
        tempCampaign.pledged -= _amountOfPledge;
        // Reduce the pledged amount for the sender
        pledgedAmount[_campaignId][msg.sender] -= _amountOfPledge;
        // Transfer tokens back to the sender
        token.transfer(msg.sender, _amountOfPledge);
    }

    // Function for the creator to claim funds if the campaign is successful
    function claim(uint256 _campaignId) public {
        Campaign storage tempCampaign = campaigns[_campaignId];

        // Ensure only the creator can claim the funds
        require(msg.sender == tempCampaign.creator, "You are not the creator");
        // Ensure the campaign has ended
        require(block.timestamp > tempCampaign.endAt, "The campaign has not ended yet");
        // Ensure the funding goal has been reached
        require(tempCampaign.pledged >= tempCampaign.goal, "The goal was not reached");
        // Ensure the funds have not already been claimed
        require(tempCampaign.claimed == false, "You already claimed");

        // Mark the funds as claimed
        tempCampaign.claimed = true;
        // Transfer the pledged tokens to the creator
        token.transfer(tempCampaign.creator, tempCampaign.pledged);
    }

    // Function for backers to refund their pledged tokens if the campaign fails
    function refund(uint256 _campaignId) public {
        Campaign storage tempCampaign = campaigns[_campaignId];

        // Ensure the campaign has ended
        require(block.timestamp > tempCampaign.endAt, "The campaign has not ended yet");
        // Ensure the funding goal was not reached
        require(tempCampaign.pledged < tempCampaign.goal, "The goal was reached and you can not refund");

        // Get the pledged amount by the sender
        uint256 tempBalance = pledgedAmount[_campaignId][msg.sender];
        // Reset the pledged amount for the sender
        pledgedAmount[_campaignId][msg.sender] = 0;
        // Transfer the pledged tokens back to the sender
        token.transfer(msg.sender, tempBalance);
    }

    // Function to get campaign details by its ID
    function getCampaignWithId(uint256 _campaignId) public view returns (address, uint256, uint256, uint256, uint256, bool) {
        return (
            campaigns[_campaignId].creator,
            campaigns[_campaignId].goal,
            campaigns[_campaignId].pledged,
            campaigns[_campaignId].startAt,
            campaigns[_campaignId].endAt,
            campaigns[_campaignId].claimed
        );
    }
}
