part of 'pokemon_bloc.dart';

class PokemonState {
  final existPokemons;
  final List<PokemonElement> list;

  PokemonState({required List<PokemonElement> listPoke})
      : list = listPoke,
        existPokemons = (listPoke != null) ? true : false;
}
