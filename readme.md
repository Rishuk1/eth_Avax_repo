# FuncAndErrors Solidity Contract

This Solidity program defines a simple authentication contract that demonstrates the use of `require()`, `assert()`, and `revert()` statements. The contract allows users to set email and password, authenticate using these credentials, and manage a number associated with the user.

## Description

The `FuncAndErrors` contract implements basic authentication functionalities using Solidity. It includes:

- Functions to set and verify the user's email and password.
- A private function to set a number associated with the user.
- A function to reset the number to zero, ensuring the number is not already zero.
- Use of `require()`, `assert()`, and `revert()` statements to handle errors and validate conditions.

This contract serves as a simple introduction to using error handling and authentication mechanisms in Solidity.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to the [Remix website](https://remix.ethereum.org).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `FuncAndErrors.sol`).
3. Copy and paste the provided code into the file.

    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    contract FuncAndErrors {
        string private email;
        string private password;
        int private aNumber;

        // Set the user's email and use assert to ensure it's set correctly
        function setEmail(string memory _uEmail) public {
            email = _uEmail;
            assert(keccak256(abi.encodePacked(email)) == keccak256(abi.encodePacked(_uEmail)));
        }

        // Set the user's password and use assert to ensure it's set correctly
        function setPass(string memory _uPass) public {
            password = _uPass;
            assert(keccak256(abi.encodePacked(password)) == keccak256(abi.encodePacked(_uPass)));
        }

        // Set the user's number (private function)
        function setUserNumber(int _aNumber) private {
            aNumber = _aNumber;
        }

        // Reset the number to zero, but revert if it's already zero
        function resetTheNum() public {
            if (aNumber == 0) {
                revert("Value is already zero");
            }
            aNumber = 0;
        }

        // Authenticate the user using their email and password, and set a new number if authentication is successful
        function authenticateUser(string memory _email, string memory _pass, int _aNumber) public {
            require(
                keccak256(abi.encodePacked(email)) == keccak256(abi.encodePacked(_email)) &&
                keccak256(abi.encodePacked(password)) == keccak256(abi.encodePacked(_pass)),
                "Wrong email or password"
            );
            setUserNumber(_aNumber);
        }
    }
    ```

4. To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Ensure the "Compiler" option is set to a compatible version (e.g., `0.8.0`), and then click on the "Compile FuncAndErrors.sol" button.
5. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the `FuncAndErrors` contract from the dropdown menu, and then click on the "Deploy" button.
6. Once the contract is deployed, you can interact with it by calling the `setEmail`, `setPass`, `authenticateUser`, and `resetTheNum` functions. Use the interface provided by Remix to input the necessary parameters and execute the functions.

## Help

If you encounter any issues, ensure the following:

- The Solidity compiler version is set correctly.
- The email and password are correctly set before authentication.
- The number is not already zero when calling `resetTheNum`.

For additional help, use the [Remix documentation](https://remix-ide.readthedocs.io/en/latest/) or community forums.

## Authors

Rishav Kumar

[@RishuSo41048171](https://twitter.com/RishuSo41048171)

## License

This project is licensed under the MIT License.
