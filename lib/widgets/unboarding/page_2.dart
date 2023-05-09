import 'package:flutter/material.dart';
import 'package:nft_app_final/widgets/my_wallet.dart';

class Page2 extends StatelessWidget {
  Page2({
    super.key,
  });

  final List<String> entries = <String>[
    'assets/images/NFT5.png',
    'assets/images/NFT4.png', 
    'assets/images/NFT3.png',
    'assets/images/NFT2.png',
    'assets/images/NFT1.png',
    'assets/images/NFT0.png'
    ];

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Column(
      children: [
       Padding(
          padding: EdgeInsets.fromLTRB(0, 102, 0, 33),
          child: Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover
                    ),
                borderRadius: BorderRadius.all(Radius.circular(130)),
                ),
               child: Image.asset('assets/images/currency_bitcoin.png'),
          ),
        ),
       
         const Padding(
           padding:  EdgeInsets.fromLTRB(25, 0, 27, 14),
           child: Center(
             child: Text(
              'Imaginez posséder \n tous ces JPEG',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.w900),
              
              ),
           ),
         ),
         SizedBox(
          width: data.size.width,
          height: 130,
          child: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image(
                  height: 130,
                  image: AssetImage(entries[index])
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          )
         ),
         SizedBox(height: 30),
         const Text(
              'Vous posséderez un identifiant unique sur la \n blockchain qui pourra renvoyer (ou non) vers \n un JPEG hébergé sur un serveur qui sera \n certainement fermé dans quelques années.',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0.5,
              ),
         ),
         SizedBox(height: 200,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
            child: Row(children: [
              TextButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyWalletScreen(
                            title: 'Argent Facile NFT')),
                      ),
                  child: const Text("PASSER",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF65635E)))),
              const Spacer(),
              MaterialButton(
                onPressed: () => print("hello"),
                shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(35))),
                textColor: Colors.white,
                color: Colors.tealAccent[400],
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Icon(Icons.arrow_forward),
                ),
              )
              ]),
          )
      ],
    );
  }
}