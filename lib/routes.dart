import 'package:flutter/material.dart';
import 'package:pokodex/pages/my_teams.dart';
import 'package:pokodex/pages/onboard.dart';
import 'package:pokodex/pages/home.dart';
import 'package:pokodex/pages/select_pokemons.dart';
import 'package:pokodex/pages/team_selection.dart';
import 'package:pokodex/pages/teams.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    'onboard': (context) => const Onboard(),
    'home': (context) => const Home(),
    'teams': (context) => const Teams(),
    'teamselection': (context) => const TeamSelection(),
    'selectpokemons': (context) => const SelectPokemons(),
    'myteams': (context) => const MyTeams(),
  };
}
