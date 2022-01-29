# Peer Mountain Wallet

A Flutter project.

## Overview

The Peer Mountain Wallet (PMW) is a mobile app that communicates using Peer Chain protocol over XMPP with the Attestation Engine.
The PMW has several functions:
 - Crypto wallet, showing both fungible and non-fungible tokens owned by the client
 - Gallery, showing the currently owned NFTs and facilitating the management thereof
 - Marketplace, for searching available NFTs for purchase from attestation providers and purchasing NFTs from them. These can be attestation NFTs or any other type of NFT.
 - Addressbook, for managing contacts by blockchain address
 - Conversations, for seeing messages from and sending messages to other PM addresses, i.e. chat 

The application uses standard mnemonic wallet generation and supports the restore of an existing wallet using the initial passphrase. (Simplified in current builds for testing)

The PMW can hold crypto assets on the RSK and Ethereum blockchains (ERC-20, ERC-721, rETH) and can be extended to other chains serviced by the Attestation Engine by providing the correct key and crypto service.

APK Demo link: [Download](https://github.com/PeerMountain/KYCApp/blob/main/apks/Peermountain-29-Jan-2022-Release.apk?raw=true)
