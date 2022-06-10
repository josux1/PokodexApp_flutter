import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:pokodex/models/pokemon_model.dart';

class PokemonProvider {
  List<PokemonElement> listPokemons = [];

  getPokemons() async {
    Uri url = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

    final answer = await http.get(url);
    if (answer.statusCode == 200) {
      var data = jsonDecode(answer.body);

      return (data['pokemon'] as List)
          .map((p) => PokemonElement.fromMap(p))
          .toList();
    } else {
      log("STATUSCODE-----> ${answer.statusCode}  $answer");
      throw Exception('Failed to load pokemons');
    }
  }
  // getPokemons() async {
  //   for (int i = 1; i < 151; i++) {
  //     Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$i');

  //     final answer = await http.get(url);
  //     if (answer.statusCode == 200) {
  //       final decodedData = jsonDecode(answer.body);
  //       final pokemon = Pokemon.fromMap(decodedData);
  //       listPokemons.add(pokemon);
  //     } else {
  //       log("STATUSCODE-----> ${answer.statusCode}  $answer");
  //       throw Exception('Failed to load pokemons');
  //     }
  //   }
  //   return listPokemons;
  // }

}//