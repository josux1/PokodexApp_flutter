import 'package:flutter/material.dart';
import 'package:pokodex/utils/globals.dart';

Widget progressCircle() {
  return CircularProgressIndicator(
    color: mainColor2,
  );
}

PreferredSizeWidget myappBar() {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
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
  );
}

Widget floatingButton(context) {
  return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, 'teams');
      },
      backgroundColor: mainColor2,
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ));
}
