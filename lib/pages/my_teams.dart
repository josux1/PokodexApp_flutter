import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokodex/pages/drawer.dart';
import 'package:pokodex/pages/my_teams_details.dart';
import 'package:pokodex/services/pokemon_service.dart';
import 'package:pokodex/utils/globals.dart';
import 'package:provider/provider.dart';

class MyTeams extends StatefulWidget {
  const MyTeams({Key? key}) : super(key: key);

  @override
  State<MyTeams> createState() => _MyTeamsState();
}

class _MyTeamsState extends State<MyTeams> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonService = Provider.of<PokemonService>(context);

    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: bak,
          centerTitle: true,
          title: const Text('Mis Equipos  ',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
        ),
        body: pokemonService.allMyLists.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: pokemonService.allMyLists.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyTeamsDetails(
                                myList: pokemonService.allMyLists[index],
                                index: index,
                              )));
                    },
                    leading: const Icon(Icons.animation_outlined),
                    title: Text(
                      pokemonService.listsNames[index].toString(),
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${pokemonService.allMyLists[index][0].name}, ${pokemonService.allMyLists[index][1].name},${pokemonService.allMyLists[index][2].name}, ${pokemonService.allMyLists[index][3].name}...',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  );
                })
            // ? Center(
            //     child: Text(pokemonService.allMyLists.length.toString()),
            //   )  allMyLists
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: const Center(
                      child: Text(
                        'Aun no tienes Equipos. Cuando crees algunos, podrás verlos desde aqui.',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: LottieBuilder.asset('assets/pikachu.json')),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
