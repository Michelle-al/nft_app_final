import 'package:test/test.dart';
import 'package:nft_app_final/services/wallet.dart';

void main() {
  group('Testing wallet functions', () {
    var walletService = WalletService();

    test('Add 0.15 bitcoin in my wallet', () {
      var myWalletValue = walletService.myWallet;
      walletService.btcGain();

      expect(walletService.myWallet == myWalletValue + 0.15, true);
    });
  });
}
