# DEGEN TOKEN(ETH-AVAX:M4)

This is a smart contract in the form of Token for Degen Gaming where several functionalities can be performed.

## Description

The Smart Contract enables us to use Degen Tokens for several functionalities. We can mint tokens, transfer tokens , redeem tokens by claiming different loyalty badges and Degen Boxes as the user claim higher amount of tokens. Avalanche Fuji Test Network is used here to provide us with test AVAX tokens so that Contract can be thoroughly test its functionality.For verfication of all the transactions SnowTrace is used which reflects all transactions even failed.

## Getting Started

### Installing

You can download the DegenToken.sol file and then compile it in Remix and then choose Environment as Injected Provider - Metamask and after that deploy the contract.

### Executing program

Steps to be followed inorder to run the contract seamlessly:

1. Following steps are to be followed to create a Test Network in Metamask:
   - **Network Name**: Avalanche Fuji C-Chain
   - **New RPC URL**: https://api.avax-test.network/ext/bc/C/rpc
   - **ChainID**: 43113
   - **Symbol**: AVAX
   - **Explorer**: https://testnet.snowtrace.io/
 
2. To get free AVAX testnet Faucet(tokens) on the network in metamask, we have to the visit https://core.app/en/tools/testnet-faucet/?subnet=c&token=c where a paticular coupon code is required to get tokens.The coupon code can be easily redeemed through a website https://guild.xyz/avalanche by just completing some simple steps.
   
3. The generated secret code then has to be entered in the coupon code field and after that we will enter the address of the Account of the Test net of Avalanche.
   
4. We then receive 0.5 AVAX at once in our metamask wallet on our Avalance Fuji Network which will help us to test our smart contract.

5. Then we move to Remix and choose Environment as Injected Provider - Metamask and after that deploy the contract.

6. Now we will copy the address of the deployed contract and then paste it in Snowtrace Testnet and then click on verify and publish contracts.

7. Then we will click on verify and then select chain as Fuji, enter the address of the new contract and then select the compiler version mentioned in the solidity file. Then, we will upload the solidity file which we have to download from remix in it and click on verify.

8. After all is done we will now perform transaction in the contract and those will be logged in the Snowtrace.


## Working

After the Contract is deployed we can perform the following operations in it:

1. Minting Tokens: Creating new Tokens (can only be done by the ownwer).
2. Burning Tokens: Burn the Tokens from the whole Smart Contract.
3. RedeemTokens: By burning particular amount of token you get a special Degen-Box.
4. EarnLoyaltyBadges:By burning a little less amount of tokens you get in game loyalty badges.
5. Transfer Tokens: Transfer Token from a particular address to another address.
6. GetBalance: Check the balance of a particular address at a particular time.
7. Approve: Approve a certain address as spender so that it would be able to transact in the Smart Contract Environment.

## Help

Difficulties related to Snowtrace may occur which priorly requires the address of the contract for verification. While verification of the contract ,we have to keep in mind that the solidity version specified in the contract, the version in the solidity compiler and one chosen while verifying the address in the snowtrace should be same.

Some files requires flattening at the time of download from the Remix IDE as the JSON format has to be adaptible as normal import statements are not compatible in the verification portal of snowtrace but it is not applicable to every system.

## Authors

Samyak Jain 
[@LinkedIn](https://www.linkedin.com/in/samyak-jain-179710233/)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
