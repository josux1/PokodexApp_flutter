import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokodex/utils/globals.dart';

class Teams extends StatelessWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: bak,
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              //--
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.07),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LottieBuilder.asset('assets/pokball.json')),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: const Center(
                  child: Text(
                    'Equipos',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 24,
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
                  'Crea un equipo con tus 6 pokemones favoritos. \nGuardaremos tu equipo y lo podrás ver, cuantas veces quieras.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
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
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, 'selectpokemons');
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
}
