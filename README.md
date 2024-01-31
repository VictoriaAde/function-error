# TodoList Smart Contract

## Description

TodoList Smart Contract is a simple Solidity smart contract that demonstrates the use of `require`, `revert`, and `assert` statements for error handling and validation within smart contracts on the blockchain.

## Features

- **`require` Statement**: Used to validate inputs and enforce conditions before executing a function. It ensures that certain conditions are met before allowing the function to proceed, otherwise reverting the transaction with an error message.
- **`revert` Statement**: Used to revert the current call and revert any changes made to the contract's state. It is typically used in conjunction with `require` to provide custom error messages when certain conditions are not met.
- **`assert` Statement**: Used to check for internal errors and invariant conditions that should never occur during normal execution. It is used to provide internal consistency checks and revert the transaction if the condition evaluates to false.

````shell
npx hardhat node
npx hardhat run --network localhost scripts/deploy.js```
````
