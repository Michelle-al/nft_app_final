// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nft_app_final/widgets/my_wallet.dart';
// import 'package:go_router/go_router.dart';

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              Container(
                width: double.maxFinite,
                height: data.size.height/3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover
                    ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                  ),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(26, 64, 26, 13),
                    child: Text(
                      'Inscrivez vous \n maintenant',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5 ),
                    ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      textAlign: (TextAlign.center),
                      'On vous offre un NFT à l’inscription ! Il vaudra \n très certainement 10 fois son prix dans \n quelques années',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 0.5, ),
                      )
                      
                  )
                ]),
              ),
              const Positioned(
                bottom: -20,
                right: 28,
                child: Image(
                  width: 48,
                  height: 48,
                  image: AssetImage('assets/images/gift.png'),
                )
              ),
              
              
            ]
          ),
          const SizedBox(height: 40),
          Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: TextFormField(
                      decoration:  const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent)),
                        labelText: 'Identifiant',
                        hintText: 'Identifiant',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent)),
                        labelText: 'Mot de passe',
                      ),
                    ),
                  ),
                ],
              ),
          const SizedBox(height: 30),
          Center(
            child: MaterialButton(
              onPressed: () => 
              // GoRouter.of(context).go('/myWallet'),
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyWalletScreen(
                        title: 'Argent Facile NFT')),
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              textColor: Colors.white,
              color: Colors.tealAccent[400],
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text('INSCRIPTION'),
              ),
            ),
          )
        ],

    );
  }
}
