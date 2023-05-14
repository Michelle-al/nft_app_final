import 'package:flutter/material.dart';
import 'package:nft_app_final/widgets/nav-drawer.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../marketplace.dart';
import '../services/wallet.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key, required this.title});

  final String title;

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  var walletService = WalletService();

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        // leading:
        title: Text(widget.title),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MyWalletScreen(title: 'Argent Facile NFT')),
            ),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
            child: Center(
                child: MaterialButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RickAndMortyApi()),
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              textColor: Colors.deepPurpleAccent,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text(
                      'PLACE DE MARCHE NFT',
                      style: TextStyle(
                          letterSpacing: 1.25, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Icon(
                    Icons.storefront,
                    color: Colors.deepPurpleAccent,
                  ),
                ],
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.5, 15, 18.5, 18.5),
            child: Container(
              // height: data.size.height / 4,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(16.5, 20, 0, 30),
                    child: Text(
                      'MON WALLET',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.5),
                    ),
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        (walletService.myWallet).toStringAsFixed(2),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      Icon(Icons.currency_bitcoin, color: Colors.white),
                    ],
                  )),
                  const SizedBox(height: 30),
                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: MaterialButton(
                        onPressed: () => setState(() {
                          walletService.btcGain();
                        }),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(35))),
                        textColor: Colors.white,
                        color: Colors.tealAccent[400],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: Text(
                            'GAGNER ${walletService.btcToWin.toStringAsFixed(2)} BTC',
                            style: const TextStyle(letterSpacing: 1.25),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
            indent: 18.5,
            endIndent: 18.5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.5, 18.5, 18.5, 4),
            child: TextField(
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  walletService.valueToSell = double.tryParse(value) ?? 0.00;
                });
              },
              keyboardType: TextInputType.number,
              // controller: _amountToSellController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(33, 0, 0, 20),
                child: Text('Spécifier un montant à revendre',
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Center(
                child: MaterialButton(
              onPressed: () => {
                setState(() {
                  if (walletService.myWallet >= walletService.valueToSell) {
                    walletService.btcToamountToSell(walletService.valueToSell);
                  } else {
                    _showAlert("Information",
                        "Le solde de votre Wallet est insuffisant.");
                  }
                })
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              textColor: Colors.deepPurpleAccent,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  "REVENDRE POUR ${walletService.amountToSellInEuros()}€",
                  style: TextStyle(
                      letterSpacing: 1.25, fontWeight: FontWeight.w700),
                ),
              ),
            )),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
            indent: 18,
            endIndent: 18.5,
          ),
          Padding(
            padding: const EdgeInsets.all(18.5),
            child: Container(
              // height: data.size.height / 5,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_light.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16.5, 20, 0, 30),
                    child: Text(
                      'MON WALLET EN EUROS',
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        walletService.myWalletInEuros.toStringAsFixed(2),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.euro,
                        color: Colors.black,
                      ),
                    ],
                  )),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dynamic _showAlert(String title, String text) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.deepPurple),
        contentTextStyle: TextStyle(color: Colors.deepPurple),
        title: Text(title),
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              child: const Text("ok"),
            ),
          ),
        ],
      ),
    );
  }
}
