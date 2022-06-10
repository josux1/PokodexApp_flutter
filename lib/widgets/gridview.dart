// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pokodex/models/pokemon_model.dart';
import 'package:pokodex/pages/pokemon_detail.dart';
import 'package:pokodex/services/pokemon_service.dart';
import 'package:pokodex/widgets/card_pokemon.dart';
import 'package:provider/provider.dart';

class GridViewPokemon extends StatefulWidget {
  const GridViewPokemon({super.key, required this.listPokemons});
  final List<PokemonElement> listPokemons;

  @override
  State<GridViewPokemon> createState() => _GridViewPokemonState();
}

@override
class _GridViewPokemonState extends State<GridViewPokemon> {
  // @override
  // void initState() {
  //   super.initState();
  //   final pokemonService = Provider.of<PokemonService>(context);
  //   pokemonService.setPokemons(widget.listPokemons);
  //   setState(() {});
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonService = Provider.of<PokemonService>(context);
    pokemonService.setPokemons(widget.listPokemons);
    setState(() {});

    return GridView.builder(
      itemCount: widget.listPokemons.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // mainAxisExtent: 1,
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: size.height * 0.012,
            right: size.height * 0.012,
            bottom: size.height * 0.02,
          ),
          child: Stack(
            children: [
              CardPokemon(
                isSelect: false,
                index: index,
                listPokemons: widget.listPokemons,
              ),
              Positioned(
                top: 15,
                child: InkWell(
                    onTap: () {
                      dispose;

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PokemonDetail(
                                pokemon: widget.listPokemons[index],
                              )));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: size.height * 0.2,
                      width: size.width * 0.46,
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
