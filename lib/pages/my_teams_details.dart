import 'package:flutter/material.dart';
import 'package:pokodex/models/pokemon_model.dart';
import 'package:pokodex/pages/pokemon_detail.dart';
import 'package:pokodex/services/pokemon_service.dart';
import 'package:pokodex/utils/globals.dart';
import 'package:pokodex/widgets/card_pokemon.dart';
import 'package:provider/provider.dart';

class MyTeamsDetails extends StatefulWidget {
  final List<PokemonElement> myList;
  final int index;
  const MyTeamsDetails({Key? key, required this.myList, required this.index})
      : super(key: key);

  @override
  State<MyTeamsDetails> createState() => _MyTeamsDetailsState();
}

class _MyTeamsDetailsState extends State<MyTeamsDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonService = Provider.of<PokemonService>(context);

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: bak,
          elevation: 0,
          title: Text(pokemonService.getNamesMyLists[widget.index],
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
        ),
        body: ListView.builder(
            itemCount: widget.myList.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: size.height * 0.012,
                  right: size.height * 0.012,
                  bottom: size.height * 0.02,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: CardPokemon(
                        isSelect: false,
                        index: index,
                        listPokemons: widget.myList,
                      ),
                    ),
                    Center(
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PokemonDetail(
                                      pokemon: widget.myList[index],
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
            }));
  }
}
