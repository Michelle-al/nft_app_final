import 'package:flutter/material.dart';
import 'package:nft_app_final/widgets/nav-drawer.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key, required this.title});

  final String title;

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final double _btcToWin = 0.1;
  num _myWallet = 0.0;
  String _myWalletToString = '0.0';

  void _btcGain() {
    setState(() {
      //  _myWallet = (_myWallet.toDouble() + _btcToWin).toStringAsFixed(2);

      _myWallet =
          (num.parse((_myWallet.toDouble() + _btcToWin).toStringAsFixed(2)) +
                  _btcToWin) -
              0.1;
      _myWalletToString = _myWallet.toStringAsFixed(1);
    });
  }

  final _amountToSellController = TextEditingController();
  num _myWalletInEuros = 0.0;
  String _myWalletInEurosTostring = '0';

  void _btcToamountToSell() {
    setState(() {
      final double amountToSell =
          double.parse(_amountToSellController.text) * 25746.49;
      if (_myWallet >= double.parse(_amountToSellController.text)) {
        _myWallet -= double.parse(_amountToSellController.text);
        _myWalletToString = _myWallet.toStringAsFixed(1);
        _myWalletInEuros = _myWalletInEuros + amountToSell;
        _myWalletInEurosTostring = _myWalletInEuros.toStringAsFixed(1);
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            title: const Text("Information"),
            content: const Text("Le solde de votre Wallet est insuffisant."),
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
    });
  }

  String _amountToSell = 'X';
  void _amountToSellInEuros() {
    _amountToSell = (double.parse(_amountToSellController.text) * 25746.49)
        .toStringAsFixed(2);
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _amountToSellController.addListener(_amountToSellInEuros);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _amountToSellController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(widget.title),
        actions: const <Widget>[],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.5),
              child: Container(
                height: data.size.height / 4,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
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
                          _myWalletToString,
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
                    Center(
                        child: MaterialButton(
                      onPressed: () => _btcGain(),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                      textColor: Colors.white,
                      color: Colors.tealAccent[400],
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text(
                          'GAGNER 0.1 BTC',
                          style: TextStyle(letterSpacing: 1.25),
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
                onChanged: (text) {
                  _amountToSellInEuros;
                },
                keyboardType: TextInputType.number,
                controller: _amountToSellController,
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
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Center(
                  child: MaterialButton(
                onPressed: () => {_btcToamountToSell()},
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                textColor: Colors.deepPurple,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    'REVENDRE POUR $_amountToSell€',
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
                height: data.size.height / 5,
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
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _myWalletInEurosTostring,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900),
                        ),
                        Icon(Icons.euro),
                      ],
                    )),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}