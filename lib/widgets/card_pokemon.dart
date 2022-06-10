// ignore_for_file: unrelated_type_equality_checks, prefer_typing_uninitialized_variables

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokodex/models/pokemon_model.dart';
import 'package:pokodex/utils/globals.dart';

class CardPokemon extends StatefulWidget {
  const CardPokemon(
      {Key? key,
      required this.index,
      required this.listPokemons,
      required this.isSelect})
      : super(key: key);

  final int index;
  final bool isSelect;
  final List<PokemonElement> listPokemons;

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var type = widget.listPokemons[widget.index].type[0].toString();

    return Align(
      child: FadeIn(
        duration: const Duration(milliseconds: 250),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent),
          height: size.height * 0.2,
          width: size.width * 0.45,
          child: Center(
            child: Stack(
              children: [
                Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: type == 'Type.GRASS'
                        ? Colors.green
                        : type == 'Type.FIRE'
                            ? secondColor
                            : type == 'Type.WATER'
                                ? Colors.blue
                                : type == 'Type.NORMAL'
                                    ? bakColor
                                    : type == 'Type.ELECTRIC'
                                        ? mainColor1
                                        : type == 'Type.GROUND'
                                            ? Colors.brown
                                            : Colors.grey,
                  ),
                  height: size.height * 0.2,
                  width: size.width * 0.47,
                ),
                Positioned(
                  left: 50,
                  top: 55,
                  child: SizedBox(
                      height: size.height * 0.15,
                      width: size.width * 0.35,
                      child: Image.asset('assets/pokeball.png')),
                ),
                Positioned(
                  left: 55,
                  top: 20,
                  child: SizedBox(
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 50),
                      fit: BoxFit.cover,
                      imageUrl: widget.listPokemons[widget.index].img,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 20,
                  child: Text(
                    widget.listPokemons[widget.index].name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 50,
                  child: SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.24,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            widget.listPokemons[widget.index].type.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: Colors.white24,
                                height: size.height * 0.03,
                                width: size.width * 0.15,
                                child: Center(
                                  child: Text(
                                    widget
                                        .listPokemons[widget.index].type[index]
                                        .toString()
                                        .characters
                                        .toString()
                                        .substring(5),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
