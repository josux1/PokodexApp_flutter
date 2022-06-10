import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokodex/utils/globals.dart';

class MyAppNoInternet extends StatelessWidget {
  const MyAppNoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokodesk No internet',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: bak,
          title: const Text('Pokodex',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              )),
        ),
        body: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LottieBuilder.asset('assets/pikachu.json')),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 50,
                  right: 50,
                ),
                child: Text(
                  '¡Oops! Parece que no tienes conexión a internet. Conéctate a una red wifi o móvil y abre de nuevo la applicación.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
