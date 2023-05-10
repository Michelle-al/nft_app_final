import 'dart:ui';
// import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:nft_app_final/requete_http.dart';
import 'package:nft_app_final/widgets/unboarding/unboarding.dart';
import 'widgets/my_wallet.dart';

// GoRouter configuration
// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => OnboardingPager(),
//     ),
//     GoRoute(
//       path: '/myWallet',
//       builder: (context, state) => MyWalletScreen(title: 'Argent Facile NFT'),
//     ),
//   ],
// );
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter - Basics';

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   routerConfig: _router,
    //   title: _title,
    //   theme: ThemeData(
    //     primarySwatch: Colors.deepPurple,
    //   ),
    // );
    return MaterialApp(
      home: AppWrapper(),
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // textTheme: GoogleFonts.r
        // scaffoldBackgroundColor: Colors.green,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 20.0, fontFamily: 'Roboto'),
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
              fontSize: 20.0, fontFamily: 'Roboto', color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      darkTheme: ThemeData.dark(),
    );
  }
}

class AppWrapper extends StatefulWidget {
  AppWrapper({Key? key}) : super(key: key);

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool skipOnboarding = false;
  @override
  Widget build(BuildContext context) {
    if (skipOnboarding == true) {
      return OnboardingPager();
    } else {
      return RickAndMortyApi();
      // MyWalletScreen(title: 'Argent Facile NFT');
    }
  }
}
