import 'dart:math';

class Web3Utils {
  static const rpcUrl = "https://public-node.testnet.rsk.co";
  static const erc20ContractAddress = "0xAD736b1e455de54bbc7B061aE925ac1C5BffBE55";
  static const cashierContractAddress = "0xd1A01ccF70Cd5Be98f3DFEB36e8d943260f161db";

  static int getRandomInt([int? max]) => Random().nextInt(max ?? 10000000);
}

class FunctionNames {
  static const balanceOf = 'balanceOf';
  static const allowance = 'allowance';
  static const mint = 'mint';
  static const approve = 'approve';
  static const approval = 'Approval';

  static const deposit = 'deposit';
}
