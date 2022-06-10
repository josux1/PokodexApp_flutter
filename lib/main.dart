// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:pokodex/pages/no_internet.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pokodex/pages/onboard.dart';
import 'package:pokodex/pages/home.dart';
import 'package:pokodex/routes.dart';
import 'package:pokodex/services/pokemon_service.dart';
import 'package:pokodex/utils/globals.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt('initScreen');

  runApp(const MyApp());

  // var connectivityResult = await (Connectivity().checkConnectivity());
  // if (connectivityResult == ConnectivityResult.mobile) {
  //   runApp(const MyApp());
  // } else if (connectivityResult == ConnectivityResult.wifi) {
  //   runApp(const MyApp());
  // } else {
  //   runApp(const MyAppNoInternet());
  // }
} //

// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokodex',
        home: EasySplashScreen(
          logo: Image.asset('assets/logo.png'),
          logoSize: 120,
          backgroundColor: Colors.white,
          showLoader: true,
          loadingText: const Text("Cargando..."),
          loaderColor: mainColor2,
          navigator: initScreen == 0 || initScreen == null
              ? const Onboard()
              : const Home(),
          durationInSeconds: 3,
        ),
        routes: getAppRoutes(),
      ),
    );
  }
}
