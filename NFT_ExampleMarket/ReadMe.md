# NFT Example Market

Welcome to the **NFT Example Market**! This folder contains smart contracts that form the foundation of a marketplace for trading artwork NFTs using Tether tokens (ERC20). Below is an overview of the purpose, functionality, and structure of the smart contracts included in this project.

## Overview
This project implements a marketplace for digital artworks using Ethereum-based tokens. Customers can purchase NFTs (artworks) by paying 1 Tether token per NFT. The smart contracts in this folder handle token generation, NFT management, and the purchasing process.

## Smart Contracts

### 1. Tether (ERC20 Token)
This contract generates Tether tokens, which act as the payment currency for the marketplace.
- **Key Features:**
  - Implements the ERC20 standard.
  - Mintable and transferable tokens.
  - Used as the sole currency for purchasing NFTs in the marketplace.

### 2. ArtWork (ERC721 Token)
This contract represents individual artworks as NFTs.
- **Key Features:**
  - Implements the ERC721 standard using OpenZeppelin.
  - Each token represents a unique artwork.
  - Enables minting and transferring of artwork tokens.

### 3. Agreement Contract
This contract manages the purchase agreements between customers and the marketplace.
- **Key Features:**
  - Enforces the rule that 1 Tether equals 1 artwork NFT.
  - Handles token transfers between customers and the marketplace upon purchase.
  - Ensures secure and seamless transactions.

## How It Works
1. **Token Setup**: The Tether contract mints tokens that are distributed to customers.
2. **Artwork NFTs**: The ArtWork contract manages minting and ownership of NFTs.
3. **Purchase Agreement**: Customers interact with the Agreement contract to buy NFTs. Each purchase deducts 1 Tether token from the customer's balance and transfers the corresponding artwork NFT.

## Directory Structure
```
NFT_exampleMarket/
├── Tether.sol        # ERC20 token contract
├── ArtWork.sol       # ERC721 token contract
├── Agreement.sol     # Purchase agreement contract
└── README.md         # Documentation
```

## Contribution
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a branch for your feature or bug fix.
3. Submit a pull request with detailed information about your changes.

## License
This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.

---

Feel free to explore and expand this marketplace! If you encounter any issues, please open an issue or contact me for support. [email] (gstoyanov42gmail.com)
