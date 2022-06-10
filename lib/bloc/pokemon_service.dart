// import 'dart:async';

// import 'package:pokodex/models/pokemon_model.dart';

// class PokemonService {
//   List<PokemonElement> pokemons = [];

//   final StreamController<List<PokemonElement>> _pokemonStreamController =
//       StreamController();

//   List<PokemonElement> get getPokemons => pokemons;
//   bool get existPokemon => pokemons != null ? true : false;

//   Stream<List<PokemonElement>> get pokemonStream =>
//       _pokemonStreamController.stream;

//   setPokemons(List<PokemonElement> pokemonsList) {
//     pokemons = pokemonsList;
//     _pokemonStreamController.add(pokemonsList);
//   }
// }

// //final pokemonService = _PokemonService();
