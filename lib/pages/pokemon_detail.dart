import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokodex/models/pokemon_model.dart';
import 'package:pokodex/utils/globals.dart';
import 'package:pokodex/utils/widgets.dart';
import 'package:pokodex/widgets/pokemon_detail_widgets.dart';

class PokemonDetail extends StatefulWidget {
  final PokemonElement pokemon;
  const PokemonDetail({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var type = widget.pokemon.type[0].toString();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: type == 'Type.GRASS'
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
        appBar: myappBar2(type),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: size.height - AppBar().preferredSize.height,
              width: size.width,
              child: Stack(
                children: [
                  backgroundColor(type, size),
                  backLogo(size),
                  whiteMenu(size),
                  pokemonImage(size, widget.pokemon),
                  titleName(size, widget.pokemon),
                  menu(size, type, widget.pokemon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menu(size, type, PokemonElement pokemon) {
    return Positioned(
      top: size.height * 0.44,
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            child: CupertinoSegmentedControl<int>(
              pressedColor: Colors.black12,
              borderColor: Colors.transparent,
              unselectedColor: const Color(0xffefeff0),
              selectedColor: type == 'Type.GRASS'
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
              onValueChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
              groupValue: value,
              children: const {
                0: Text('About',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    )),
                1: Text('Base Stats',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    )),
              },
            ),
          ),
          value == 0
              ? SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                  // color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.1,
                      top: size.width * 0.05,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size.width * 0.015,
                          ),
                          child: Row(
                            children: [
                              const Text('Height: ',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.05,
                                ),
                                child: Text(pokemon.height,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size.width * 0.015,
                          ),
                          child: Row(
                            children: [
                              const Text('Weight: ',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.05,
                                ),
                                child: Text(pokemon.weight,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size.width * 0.015,
                          ),
                          child: Row(
                            children: [
                              const Text('Candy: ',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.05,
                                ),
                                child: Text(pokemon.candy,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size.width * 0.015,
                          ),
                          child: Row(
                            children: [
                              const Text('Candys: ',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.05,
                                ),
                                child: Text(pokemon.candyCount.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size.width * 0.015,
                          ),
                          child: Row(
                            children: [
                              const Text('Eggs: ',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.05,
                                ),
                                child: Text(
                                    pokemon.egg
                                        .toString()
                                        .characters
                                        .toString()
                                        .substring(8),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const Text('Weaknesses: ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            )),
                        SizedBox(
                          height: size.height * 0.05,
                          width: size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: widget.pokemon.weaknesses.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      // color: const Color(0xffefeff0),
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
                                                          : type ==
                                                                  'Type.GROUND'
                                                              ? Colors.brown
                                                              : Colors.grey,
                                      height: size.height * 0.02,
                                      width: size.width * 0.19,
                                      child: Center(
                                        child: Text(
                                          widget.pokemon.weaknesses[index]
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
                      ],
                    ),
                  ),
                )
              : value == 1
                  ? SizedBox(
                      height: size.height * 0.4,
                      width: size.width,
                      // color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.1,
                          top: size.width * 0.05,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: size.width * 0.015,
                              ),
                              child: Row(
                                children: [
                                  const Text('Spawn Time: ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                    ),
                                    child: Text(pokemon.spawnTime,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: size.width * 0.015,
                              ),
                              child: Row(
                                children: [
                                  const Text('Spawn Chance: ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                    ),
                                    child: Text(pokemon.spawnChance.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: size.width * 0.015,
                              ),
                              child: Row(
                                children: [
                                  const Text('Average Spawns: ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                    ),
                                    child: Text(pokemon.avgSpawns.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: size.width * 0.015,
                              ),
                              child: Row(
                                children: [
                                  const Text('Multipliers: ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                    ),
                                    child: Text(pokemon.multipliers.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: progressCircle(),
                    )
        ],
      ),
    );
  }
}//
