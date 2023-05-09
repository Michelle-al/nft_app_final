import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nft_app_final/character.dart';


class RickAndMortyApi extends StatefulWidget {
  const RickAndMortyApi({super.key});

  @override
  State<RickAndMortyApi> createState() => _RickAndMortyApiState();
}

class _RickAndMortyApiState extends State<RickAndMortyApi> {
  late Future<CharacterResult> futureCharacter;
  Future<List<Result>>  getCharacters() async {
    final response =  await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    
    if (response.statusCode == 200) {
      print(CharacterResult.fromJson(jsonDecode(response.body)));
      return CharacterResult.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Erreur au chargement des personnages');
    }

    @override
  void initState() {
    super.initState();
    futureCharacter = getCharacters() as Future<CharacterResult>;
  }
}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
       backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text('Api'),
        actions: const <Widget>[],
      ),
      body: FutureBuilder(
        future: futureCharacter,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.info.count as String);
          }else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
      // body: Center(
      //   child: MaterialButton(
      //                 onPressed: () => print(getCharacters()),
      //                 shape: const RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.all(Radius.circular(35))),
      //                 textColor: Colors.white,
      //                 color: Colors.tealAccent[400],
      //                 child: const Padding(
      //                   padding:
      //                       EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      //                   child: Text(
      //                     'Tester',
      //                     style: TextStyle(letterSpacing: 1.25),
      //                   ),
      //                 ),
      //               )
      // )
    );
  }
}



