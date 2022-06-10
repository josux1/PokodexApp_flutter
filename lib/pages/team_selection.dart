import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokodex/services/pokemon_service.dart';
import 'package:pokodex/utils/globals.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeamSelection extends StatefulWidget {
  const TeamSelection({Key? key}) : super(key: key);

  @override
  State<TeamSelection> createState() => _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelection> {
  final controller = DragSelectGridViewController();
  TextEditingController teamName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonService = Provider.of<PokemonService>(context);

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
                    'Nombra tu Equipo',
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
                  '¿Cómo se llamará tu equipo?: ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: Align(
                    child: SizedBox(
                      height: size.height * 0.06,
                      width: size.width * 0.8,
                      child: TextField(
                        textAlign: TextAlign.center,
                        autofocus: true,
                        cursorColor: secondColor,
                        controller: teamName,
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
                                width: 3,
                                color: bakColorlight.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.black12,
                          hintText: 'Ej: Griffindor🤘...',
                        ),
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
                        onPressed: () {
                          validatetions(teamName, pokemonService);
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

  setName(TextEditingController name, pokemonService) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(teamName.text, teamName.text);
    pokemonService.addInNameLists(teamName.text);

    print(teamName.text);
  }

  validatetions(TextEditingController teamName, pokemonService) {
    if (teamName.text.isEmpty) {
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
                  'Ingresa el nombre de tu equipo para continuar.',
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
      setName(teamName, pokemonService);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Text(
                'Equipo generado ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
      Navigator.pushReplacementNamed(context, 'home');
    }
  }
}//
