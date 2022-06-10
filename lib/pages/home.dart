import 'package:flutter/material.dart';
import 'package:pokodex/pages/drawer.dart';
import 'package:pokodex/utils/globals.dart';
import 'package:pokodex/utils/widgets.dart';
import 'package:pokodex/widgets/list_pokemons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "";

  @override
  void initState() {
    super.initState;
    getName();
  }

  Future getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: myappBar(),
      floatingActionButton: floatingButton(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.07,
            ),
            child: Row(
              children: [
                const Text('Que tal ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
                Text(name,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: mainColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.015,
              left: size.width * 0.07,
              right: size.width * 0.07,
              bottom: size.height * 0.015,
            ),
            child: const Text(
                'Te damos la bienvenida, esperamos que te sientas como en casa.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 16,
                )),
          ),
          const ListPokemons()
        ],
      ),
    );
  }
} //
