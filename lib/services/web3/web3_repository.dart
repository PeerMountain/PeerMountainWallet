import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/challenge-signed.pb.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/utils/eth/abi.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

/// Only used for sending request to kyc service
/// For other web3 services and methods please check *[Web3DartService]

@singleton
class Web3Repository {
  late final String erc20ContractAbi;
  late final String cashierContractAbi;

  static const erc20ContractAddressString = "0x4d26774771a9D7CA38Ae419b695deC042B25e98d";
  static const cashierContractAddressString = "0x7b7Ec4C333fC5E3D0B4001fC818491A7AE59a407";

  static const amountToMintAndApprove = 10000000000000000;

  Web3Repository() {
    init();
  }

  Future<void> init() async {
    /// READ ERC20 Contract
    erc20ContractAbi = await rootBundle.loadString(Assets.contractsERC20);

    /// READ Cashier Contract
    cashierContractAbi = await rootBundle.loadString(Assets.contractsCashierContractV2);
  }

  EthereumAddress erc20ContractAddress() => EthereumAddress.fromHex(erc20ContractAddressString);

  EthereumAddress cashierContractAddress() => EthereumAddress.fromHex(cashierContractAddressString);

  /// Get Ethereum account from provided Private-Key
  EthPrivateKey get credentials {
    final credentials = EthPrivateKey.fromHex(cryptoAccount.privateKey!);
    return credentials;
  }

  /// Load ERC20 Contract for web3client
  /// for every traction we need to pass this contract to web3client
  /// so that it can verify our mobile client with server for security
  DeployedContract _loadCashierContract() {
    final contract = DeployedContract(
      ContractAbi.fromJson(cashierContractAbi, 'CashierContractV2'),
      cashierContractAddress(),
    );
    return contract;
  }

  /// Load ERC20 Contract for web3client
  /// for every traction we need to pass this contract to web3client
  /// so that it can verify our mobile client with server for security
  DeployedContract _loadErc20Contract() {
    final contract = DeployedContract(
      ContractAbi.fromJson(erc20ContractAbi, 'ERC20'),
      erc20ContractAddress(),
    );
    return contract;
  }

  /// WILL BE USED TO CALL RPC METHOD OVER SERVER
  Future<List<dynamic>> makeRPCCall({
    required DeployedContract contract,
    required ContractFunction function,
    List<dynamic>? args = const [],
  }) async {
    try {
      final client = Web3Client(Web3Utils.rpcUrl, http.Client());

      /// request to server for method it will then return
      /// response back to us in List<dynamic> and we will have
      /// our response in 0th index.
      final response = await client.call(
        contract: contract,
        function: function,
        params: args!,
      );
      return response;
    } catch (e, stackTrace) {
      showLog("makeRPCCall exception =====>>> $e");
      showLog("makeRPCCall exception stackTrace =====>>> $stackTrace");
    }

    return [];
  }

  /// WILL BE USED TO SEND TRANSACTION OVER BLOCKCHAIN SERVER
  Future<dynamic> sendTransaction({
    required DeployedContract contract,
    required ContractFunction function,
    List<dynamic>? args = const [],
  }) async {
    try {
      final client = Web3Client(Web3Utils.rpcUrl, http.Client());

      /// request to server for method it will then return
      /// response back to us in List<dynamic> and we will have
      /// our response in 0th index.
      final transactionHash = await client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: function,
          parameters: args!,
        ),
      );
      return transactionHash;
    } catch (e, stackTrace) {
      showLog("sendTransaction exception =====>>> $e");
      showLog("sendTransaction exception stackTrace =====>>> $stackTrace");
    }

    return null;
  }

  /// Get address balance from ethereum server
  Future<num?> getBalanceFromEthereumServer() async {
    try {
      final client = Web3Client(Web3Utils.rpcUrl, http.Client());
      final balance = await client.getBalance(credentials.address);
      showLog("ethereum balance =====>>> ${balance.getValueInUnit(EtherUnit.ether)}");
      return balance.getValueInUnit(EtherUnit.ether);
    } catch (e, stackTrace) {
      showLog("getBalanceFromEthereumServer exception =====>>> $e");
      showLog("getBalanceFromEthereumServer exception stackTrace =====>>> $stackTrace");
    }
  }

  /// Get address's mintable balance from our server in PMTN tokens
  /// THIS IS USER ACCOUNT'S PMTN TOKEN MINTABLE BALANCE
  ///
  /// function :- ERC20::balanceOf
  Future<List<dynamic>?> getMintablePMTNTokens() async {
    try {
      /// load contract for web3client
      final contract = _loadErc20Contract();

      /// create ethereum function from functionName
      final function = contract.function(FunctionNames.balanceOf);

      final balance = await makeRPCCall(
        contract: contract,
        function: function,
        args: [credentials.address],
      );
      showLog("getAllPMTNTokens =====>>> $balance");
      return balance;
    } catch (e, stackTrace) {
      showLog("getAllPMTNTokens exception =====>>> $e");
      showLog("getAllPMTNTokens exception stackTrace =====>>> $stackTrace");
    }
  }

  /// Get address balance from our server in PMTN tokens
  /// THIS IS USER ACCOUNT'S PMTN TOKEN DEPOSITED BALANCE
  ///
  /// function :- CashierContractV2::balanceOf
  Future<List<dynamic>?> getDepositedPMTNTokens() async {
    try {
      /// load contract for web3client
      final contract = _loadCashierContract();

      /// create ethereum function from functionName
      final function = contract.function(FunctionNames.balanceOf);

      final balance = await makeRPCCall(
        contract: contract,
        function: function,
        args: [credentials.address],
      );
      showLog("getDepositedPMTNTokens =====>>> $balance");
      return balance;
    } catch (e, stackTrace) {
      showLog("getDepositedPMTNTokens exception =====>>> $e");
      showLog("getDepositedPMTNTokens exception stackTrace =====>>> $stackTrace");
    }
  }

  /// To follow [mintAmount] => [checkPmtnTokenAllowance] => [approveAmount] flow for user
  ///
  /// It will be executed ONCE FOR EVERY USER meaning although it will be checked
  /// on every app start up but it will executed ONLY ONCE for every new user,
  /// once followed successfully it will never be executed again for current user AS OF NOW.
  ///
  /// So the flow goes like this :-
  ///
  /// 1. check user's [getDepositedPMTNTokens]
  /// 2. if balance == 0.0 then check and call [mintAmount] method else break the process,
  /// 3. on success response of [NftMintResponse] check and call [checkPmtnTokenAllowance] method
  /// and if returned allowance == 0.0 then call [approveAmount] method else break the process
  /// and continue with next tasks.
  Future<dynamic> performMintAllowanceApproveAmountFlow() async {
    try {
      showLoader();
      final balanceOf = await web3Repository.getMintablePMTNTokens();
      hideLoader();

      if (balanceOf != null && balanceOf.isNotEmpty) {
        final balance = balanceOf[0].toDouble();
        if (balance == 0.0) {
          showLoader();
          final mint = await web3Repository.mintAmount(Web3Repository.amountToMintAndApprove);
          hideLoader();

          if (mint != null) {
            normalSendService.sendMintRequest(signedTransaction: mint);
          }
        }
      }
    } catch (e, stackTrace) {
      showLog("performMintAllowanceApproveAmountFlow exception =====>>> $e");
      showLog("performMintAllowanceApproveAmountFlow stackTrace =====>>> $stackTrace");
    }
  }

  /// Approve user's provided amount on kyc server
  Future<String?> mintAmount(num amount) async {
    try {
      final client = Web3Client(Web3Utils.rpcUrl, http.Client());

      /// load contract for web3client
      final contract = _loadErc20Contract();

      /// create ethereum mint from functionName
      final mint = contract.function(FunctionNames.mint);

      final signature = await client.signTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: mint,
          parameters: [
            credentials.address,
            BigInt.from(amount),
          ],
        ),
        chainId: null,
        fetchChainIdFromNetworkId: true,
      );

      /// convert ints to hexString
      final hexString = bytesToHex(signature);
      showLog("mintAmount =====>>> $hexString");
      return hexString;
    } catch (e, stackTrace) {
      showLog("mintAmount exception =====>>> $e");
      showLog("mintAmount exception stackTrace =====>>> $stackTrace");
    }
  }

  /// Get user allowance from kyc server
  ///
  /// If allowance > 0, then user should proceed with buying NFT
  /// If allowance = 0, then user should a) *[mintAmount] and b) *[approveAmount]
  Future<List<dynamic>?> checkPmtnTokenAllowance() async {
    try {
      /// load contract for web3client
      final contract = _loadErc20Contract();

      /// create ethereum function from functionName
      final function = contract.function(FunctionNames.allowance);

      final response = await makeRPCCall(
        contract: contract,
        function: function,
        args: [
          credentials.address,
          cashierContractAddress(),
        ],
      );
      showLog("checkAllowance =====>>> $response");
      return response;
    } catch (e, stackTrace) {
      showLog("checkAllowance exception =====>>> $e");
      showLog("checkAllowance exception stackTrace =====>>> $stackTrace");
    }
  }

  /// Approve user's provided amount on kyc server
  Future<String?> approveAmount(num amount) async {
    try {
      final client = Web3Client(Web3Utils.rpcUrl, http.Client());

      /// load contract for web3client
      final contract = _loadErc20Contract();

      /// create ethereum function from functionName
      final function = contract.function(FunctionNames.approve);

      final signature = await client.signTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: function,
          parameters: [
            cashierContractAddress(),
            BigInt.from(amount),
          ],
        ),
        chainId: null,
        fetchChainIdFromNetworkId: true,
      );

      /// convert ints to hexString
      final hexString = bytesToHex(signature);
      showLog("approveAmount =====>>> $hexString");
      return hexString;
    } catch (e, stackTrace) {
      showLog("approveAmount exception =====>>> $e");
      showLog("approveAmount exception stackTrace =====>>> $stackTrace");
    }
  }

  /// Deposit user's provided amount to his/her account
  Future<dynamic> depositAmount(int amount) async {
    try {
      final messageHash = rawEncode(
        ['uint256', 'uint256', 'address'],
        [
          amount,
          Web3Utils.getRandomInt(),
          cashierContractAddressString,
        ],
      );

      final message = bytesToHex(messageHash, include0x: true);

      /// Sign challenged received from server
      final signature = await web3Service.signPersonalMessage(payload: message);

      showLog("depositAmount =====>>> $message");

      normalSendService.sendDepositRequest(message: message, signature: signature![Keys.signature]);
      return Keys.success;
    } catch (e, stackTrace) {
      showLog("depositAmount exception =====>>> $e");
      showLog("depositAmount exception stackTrace =====>>> $stackTrace");
    }
  }

  /// To encode payment values and will be sent in [ChallengeSignedRequest]
  Future<List<dynamic>?> encodePaymentValues({
    required String challenge,
    required String attestationProvider,
    required int price,
    required int paymentNonce,
  }) async {
    try {
      /// Step 1 :- encode values to get message hash
      final messageHash = rawEncode(
        ["address", "uint256", "uint256", "uint256", "address"],
        [
          attestationProvider,
          price,
          paymentNonce,
          Web3Utils.getRandomInt(),
          cashierContractAddressString,
        ],
      );

      /// Step 2 :- get hexString of [messageHash] obtained above
      final message = bytesToHex(messageHash, include0x: true);

      /// Step 3 :- sign [message] to get signature for this message
      final messageSignature = await web3Service.signPersonalMessage(payload: message);

      /// Step 4 :- sign [challenge] to get signature for [challenge] received from server
      final challengeSignature = await web3Service.signPersonalMessage(payload: challenge);
      return [message, messageSignature, challengeSignature];
    } catch (e, stackTrace) {
      showLog("encodePaymentValues exception =====>>> $e");
      showLog("encodePaymentValues exception stackTrace =====>>> $stackTrace");
    }
  }

  /// Transfer ownership of nft from one account to specified receiver's account.
  ///
  /// types: ["address", "uint256", "uint256", "address"]
  /// values: [receiverAddress, tokenId, senderNonce, cashierV2InstanceAddress]

  Future<dynamic> encodeAndSendNftTransferRequest({required String receiverAddress, required int tokenId}) async {
    try {
      final messageHash = rawEncode(
        ["address", "uint256", "uint256", "address"],
        [
          receiverAddress,
          tokenId,
          Web3Utils.getRandomInt(),
          cashierContractAddressString,
        ],
      );

      final message = bytesToHex(messageHash, include0x: true);

      /// Sign challenged received from server
      final signature = await web3Service.signPersonalMessage(payload: message);

      showLog("encodeAndSendNftTransferRequest =====>>> $message");

      normalSendService.sendNftTransferRequest(message: message, signature: signature![Keys.signature]);
      return Keys.success;
    } catch (e, stackTrace) {
      showLog("encodeAndSendNftTransferRequest exception =====>>> $e");
      showLog("encodeAndSendNftTransferRequest exception stackTrace =====>>> $stackTrace");
    }
  }

}
