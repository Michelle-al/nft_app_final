import 'package:flutter/material.dart';

class WalletService {
  double btcToWin = 0.15;
  double myWallet = 0.00;
  double myWalletInEuros = 0.00;
  double valueToSell = 0.00;

  void btcGain() {
    myWallet = double.tryParse((myWallet + btcToWin).toStringAsFixed(2))!;
  }

  void btcToamountToSell(double amount) {
    double amountToSell = amount * 25746.49;
    myWallet -= valueToSell;
    myWalletInEuros = myWalletInEuros + amountToSell;
  }

  String _amountToSell = '0.00';
  String amountToSellInEuros() {
    _amountToSell = (valueToSell * 25746.49).toStringAsFixed(2);
    return _amountToSell;
  }
}
