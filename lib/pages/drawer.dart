import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokodex/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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

    return Drawer(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Spacer(),
              Row(
                children: [
                  const Text('!Hola ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )),
                  Text('$name!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: mainColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LottieBuilder.asset('assets/pokemon.json'),
                  ),
                ),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              //const Spacer(),
              ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text('Home',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: size.height * 0.020,
                          fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, 'home');
                  }),
              ListTile(
                  leading: const Icon(
                    Icons.people,
                    color: Colors.black,
                  ),
                  title: Text('Mis Equipos',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: size.height * 0.020,
                          fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, 'myteams');
                  }),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
