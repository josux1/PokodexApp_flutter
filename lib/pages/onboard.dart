// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pokodex/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: bak,
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.05,
                ),
                child: const Center(
                  child: Text(
                    'Bienvenid@',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.01,
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                ),
                child: const Text(
                  'Te damos la bienvenida a Pokodex, un catalogo de los primeros 150 pokemones a tu alcanze. \n\nComo bienvenida, queremos pedirte que ingreses tu nombre para recordarte cada vez que ingreses a la app.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.1),
                child: Align(
                  child: SizedBox(
                    height: size.height * 0.06,
                    width: size.width * 0.8,
                    child: TextField(
                      textAlign: TextAlign.center,
                      cursorColor: mainColor2,
                      controller: name,
                      cursorHeight: 25,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: bakColorlight.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Colors.black12,
                        hintText: 'Nombre',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: Align(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: size.height * 0.06,
                      width: size.width * 0.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: mainColor2),
                        onPressed: () async {
                          validatetions(name);
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
                width: size.width * 0.5,
              )
            ],
          ),
        ));
  }

  setName(TextEditingController name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.text);
  }

  setPage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('initScreen', 1);
  }

  validatetions(TextEditingController name) {
    if (name.text.isEmpty) {
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
                  'Ingresa tu nombre para continuar y poder recordarte.',
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
      setName(name);
      setPage();
      Navigator.pushReplacementNamed(context, 'home');
    }
  }
}//
