import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:nft_app_final/character.dart';
import 'package:nft_app_final/rarete.dart';

class RickAndMortyApi extends StatefulWidget {
  const RickAndMortyApi({super.key});

  @override
  State<RickAndMortyApi> createState() => _RickAndMortyApiState();
}

class _RickAndMortyApiState extends State<RickAndMortyApi> {
  late Future<List<Result>> futureCharacter;

  Future<List<Result>> getCharacters() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    if (response.statusCode == 200) {
      return CharacterResult.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Erreur au chargement des personnages');
    }
  }

  @override
  void initState() {
    // futureCharacter = getCharacters() as Future<CharacterResult>;
    futureCharacter = getCharacters();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text('Place de Marché'),
        actions: const <Widget>[],
      ),
      body: FutureBuilder(
        future: futureCharacter,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Result character = snapshot.data?[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 9),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 16, 0, 0),
                          child: Text(
                            character.name,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Roboto',
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 0, 12),
                          child: Text(character.type,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                              )),
                        ),
                        Image.network(
                          character.image,
                          fit: BoxFit.cover,
                        ),
                        Stack(
                            alignment: Alignment.bottomRight,
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              14, 14, 0, 0),
                                          child:
                                              Text('Dernière position connue',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w400,
                                                  ))),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 14),
                                            child:
                                                _status(character.status.name),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 14, 14, 0),
                                            child: Text(
                                              '${character.status.name} - ${character.species.name}',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            14, 5, 0, 0),
                                        child: Text(
                                            character.location.name as dynamic,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black54)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Positioned(
                                bottom: -29,
                                right: 18,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 14),
                                        child: _fillChip(
                                            getRarete(character.rarete),
                                            color(character.rarete)))
                                  ],
                                ),
                              ),
                            ]),
                        _textColumn('Aperçu dans', character.origin.name,
                            Colors.black54),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 14),
                                  child: Icon(
                                    Icons.currency_bitcoin,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  createPrice(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                )
                              ],
                            ),
                            MaterialButton(
                              onPressed: () => print('coucou'),
                              child: Text("ACHETER",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF6200EE),
                                      fontSize: 18)),
                            )
                          ],
                        ),
                      ]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Column _textColumn(String title, dynamic text, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 0, 0),
            child: Text(title,
                style: TextStyle(
                  fontSize: 15,
                  color: color,
                  fontWeight: FontWeight.w400,
                ))),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 5, 0, 12),
          child: Text(text as dynamic,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                  color: color)),
        ),
      ],
    );
  }

  dynamic _fillChip(String text, Color color) {
    return Chip(
        backgroundColor: color,
        label: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ));
  }

  dynamic _status(dynamic status) {
    dynamic _icon(Color color) {
      return Icon(
        Icons.circle_rounded,
        size: 10,
        color: color,
      );
    }

    switch (status) {
      case "ALIVE":
        return _icon(Colors.green);
      case "DEAD":
        return _icon(Colors.red);
      default:
        return _icon(Colors.grey);
    }
  }
}
