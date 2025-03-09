Welcome to the Crowd Funding project this project demonstrates a decentralized crowd funding platform built on Ethereum using Solidity smart contracts. The platform allows creators to launch campaigns, backers to pledge funds using an ERC20 token, and provides functionalities to manage the funding process securely and transparently.

## Overview

This project consists of two main smart contracts:

1. **ERC20 Token Contract**: A standard ERC20 token used for pledging funds in the crowd funding campaign.
2. **Crowd Fund Contract**: A smart contract that manages the crowd funding process, including launching campaigns, pledging, unpledging, refunding, and claiming funds.

## Features

### ERC20 Token Contract
- **Standard ERC20 Implementation**: Compliant with the ERC20 token standard, enabling seamless integration with wallets and exchanges.
- **Token Transfers**: Backers can transfer tokens to pledge funds to campaigns.
- **Balance Tracking**: Tracks token balances of all participants.

### Crowd Fund Contract
- **Launch Campaign**: Creators can launch a new crowd funding campaign by specifying the funding goal and deadline.
- **Cancel Campaign**: Creators can cancel the campaign before starting the campaign if necessary.
- **Pledge**: Backers can pledge ERC20 tokens to support the campaign.
- **Unpledge**: Backers can withdraw their pledged tokens before the campaign deadline.
- **Refund**: If the campaign fails to meet its funding goal, backers can refund their pledged tokens.
- **Claim Funds**: If the campaign is successful, the creator can claim the funds after the deadline.

### Project processing examples
 1. **Deploy ERC20 by first account**
 2. **Mint 1000 tokens for first account**
 3. **Transfer 200 tokens for second account and 800 for the third**
 4. **Deploy CrowdFund contract by first account**
 5. **Call approve for CrowdFund address by both of first and second accounts**
 6. **Launch the campaign by first account**
 7. **Pledge 200 and 800 tokens using ID of campaign by second and third accounts**
 **You can test cancel or unpledge functions before than ending time**
 **You can test refund or claim functions after ending time of the campaign**

## Smart Contract Details

### ERC20 Token Contract

- **`totalSupply()`**: Returns the total supply of tokens.
- **`balanceOf(address account)`**: Returns the token balance of a specific account.
- **`transfer(address recipient, uint256 amount)`**: Transfers tokens to another address.
- **`approve(address spender, uint256 amount)`**: Approves a spender to transfer tokens on behalf of the owner.
- **`transferFrom(address sender, address recipient, uint256 amount)`**: Transfers tokens from one address to another on behalf of the owner.

### Crowd Fund Contract

- **`launch(uint256 goal, uint256 deadline)`**: Launches a new campaign with a funding goal and deadline.
- **`cancel()`**: Cancels the campaign before the deadline.
- **`pledge(uint256 amount)`**: Pledges tokens to the campaign.
- **`unpledge(uint256 amount)`**: Withdraws pledged tokens before the deadline.
- **`refund()`**: Refunds pledged tokens if the campaign fails.
- **`claim()`**: Claims the funds if the campaign is successful.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by the Ethereum community and various decentralized finance (DeFi) projects.

---

Feel free to explore the code, deploy the contracts, and contribute to the project. Happy coding! 🚀
