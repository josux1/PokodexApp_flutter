import 'package:flutter/material.dart';
import 'package:pokodex/providers/pokemon_provider.dart';
import 'package:pokodex/widgets/grid_load.dart';
import 'package:pokodex/widgets/gridview.dart';

class ListPokemons extends StatelessWidget {
  const ListPokemons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = PokemonProvider();

    return FutureBuilder(
      future: pokemon.getPokemons(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return GridViewPokemon(
            listPokemons: snapshot.data,
          );
        } else {
          return const GridLoad();
        }
      },
    );
  }
}
