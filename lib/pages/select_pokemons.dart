// ignore_for_file: avoid_print

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:pokodex/models/pokemon_model.dart';
import 'package:pokodex/services/pokemon_service.dart';
import 'package:pokodex/utils/globals.dart';
import 'package:pokodex/widgets/card_pokemon.dart';
import 'package:provider/provider.dart';

class SelectPokemons extends StatefulWidget {
  const SelectPokemons({Key? key}) : super(key: key);

  @override
  State<SelectPokemons> createState() => _SelectPokemonsState();
}

class _SelectPokemonsState extends State<SelectPokemons> {
  List<PokemonElement> pokemons = [];
  final controller = DragSelectGridViewController();

  @override
  void initState() {
    super.initState();
    controller.addListener(rebuild);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(rebuild);
  }

  void rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonService = Provider.of<PokemonService>(context);
    bool isElementSelected = controller.value.isSelecting;

    pokemons = pokemonService.getPokemons;
    setState(() {});

    Widget cancelButton() {
      return IconButton(
          onPressed: () {
            dispose();
            Navigator.pushNamed(context, 'home');
          },
          icon: const Icon(Icons.close));
    } //

    Widget doneButton() {
      return IconButton(
          onPressed: () {
            final selectedPokeons = controller.value.selectedIndexes
                .map<PokemonElement>((index) => pokemons[index])
                .toList();

            if (selectedPokeons.length > 6 || selectedPokeons.length < 6) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text(
                          'Casi...',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Los equipos constan de 6 elementos. Solo selecciona 6 pokemones.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Okay'))
                        ],
                      ));
              return;
            } else {
              pokemonService.addInMyCustomGlobalLists(selectedPokeons);
              Navigator.pushReplacementNamed(context, 'teamselection');
            }
          },
          icon: const Icon(Icons.done));
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          leading: isElementSelected ? cancelButton() : Container(),
          actions: [
            isElementSelected ? doneButton() : Container(),
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: bak,
          title: Text(
              isElementSelected
                  ? '${controller.value.amount.toString()} seleccionados'
                  : 'Equipos',
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              )),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.01,
                left: size.width * 0.1,
                right: size.width * 0.1,
              ),
              child: const Text(
                'Selecciona 6 de tus pokemones favoritos:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            pokemonService.existPokemons == true
                ? DragSelectGridView(
                    gridController: controller,
                    itemCount: pokemons.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                    ),
                    itemBuilder: (context, index, isSelected) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: size.height * 0.012,
                          right: size.height * 0.012,
                          bottom: size.height * 0.02,
                        ),
                        child: Stack(
                          children: [
                            CardPokemon(
                              isSelect: isSelected,
                              index: index,
                              listPokemons: pokemons,
                            ),
                            Positioned(
                              top: 15,
                              child: InkWell(
                                  //onTap: () {},
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: isSelected
                                            ? mainColor3.withOpacity(0.15)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: mainColor3.withOpacity(0.6),
                                            width: isSelected ? 3 : 0)),
                                    height: size.height * 0.2,
                                    width: size.width * 0.45,
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                  )
          ],
        ));
  }
}
