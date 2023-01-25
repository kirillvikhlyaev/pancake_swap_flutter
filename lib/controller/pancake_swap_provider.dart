import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pancake_swap_flutter/model/pair.dart';
import 'package:pancake_swap_flutter/model/token_model.dart';
import 'package:web3dart/web3dart.dart';

const tokens = <TokenModel>[
  TokenModel(
      name: 'WBNB', address: '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c'),
  TokenModel(
      name: 'CAKE', address: '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'),
  TokenModel(
      name: 'BUSD', address: '0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56'),
  TokenModel(
      name: 'USDT', address: '0x55d398326f99059fF775485246999027B3197955'),
  TokenModel(
      name: 'BTCB', address: '0x7130d2A12B9BCbFAe4f2634d864A1Ee1Ce3Ead9c'),
  TokenModel(
      name: 'ETH', address: '0x2170Ed0880ac9A755fd29B2688956BD959F933F8'),
  TokenModel(
      name: 'USDC', address: '0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d'),
];

class PancakeSwapProvider with ChangeNotifier {
  final pancakeSwapContractAddress =
      '0x10ED43C718714eb63d5aA57B78B54704E256024E';
  String ethereumClientUrl = 'https://bsc-dataseed1.binance.org';

  late Client httpClient;
  late Web3Client ethereumClient;
  late Timer fetchingTimer;

  var currentPair = Pair(tokens[0], tokens[1]);

  String dateOfReceipt = '';
  String result = '0';

  void init() {
    httpClient = Client();
    ethereumClient = Web3Client(ethereumClientUrl, httpClient);
  }

  Future<DeployedContract> _getContract(String abi) async {
    final contract = DeployedContract(
      ContractAbi.fromJson(abi, 'pancakeSwapAbi'),
      EthereumAddress.fromHex(
        pancakeSwapContractAddress.toLowerCase(),
      ),
    );
    return contract;
  }

  Future<void> getPrice(String token1Address, String token2Address) async {
    String abi =
        await rootBundle.loadString('assets/abi/pancake_swap_abi.json');
    DeployedContract contract = await _getContract(abi);

    final getThePriceContract = contract.function('getAmountsOut');
    final gettingThePrice = await ethereumClient.call(
      contract: contract,
      function: getThePriceContract,
      params: <dynamic>[
        BigInt.from(1),
        [
          EthereumAddress.fromHex(token1Address),
          EthereumAddress.fromHex(token2Address)
        ],
      ],
    );
    dateOfReceipt = DateFormat.Hms().format(DateTime.now());
    result = gettingThePrice.first[1].toString();

    fetchingTimer = Timer.periodic(const Duration(seconds: 25),
        (_) => getPrice(token1Address, token2Address));
    notifyListeners();
  }

  void changeToken1(TokenModel token) {
    if (token == currentPair.token2) {
      currentPair.token2 = currentPair.token1;
    }
    currentPair.token1 = token;
    notifyListeners();
  }

  void changeToken2(TokenModel token) {
    if (token == currentPair.token1) {
      currentPair.token1 = currentPair.token2;
    }
    currentPair.token2 = token;
    notifyListeners();
  }
}
