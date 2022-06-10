// ignore_for_file: unnecessary_null_comparison, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:pokodex/models/pokemon_model.dart';

class PokemonService with ChangeNotifier {
  List<PokemonElement> allPokemonsList = [];
  List<PokemonElement> mycustomlist = [];

  List<List<PokemonElement>> allMyLists = [];
  List<String> listsNames = [];

  bool get existPokemons =>
      allPokemonsList != null && allPokemonsList.isNotEmpty ? true : false;

  List<PokemonElement> get getPokemons => allPokemonsList;
  setPokemons(List<PokemonElement> pokemonslist) {
    allPokemonsList = pokemonslist;
    //notifyListeners();
  }

  List<PokemonElement> get getListsPokemons => mycustomlist;
  setMyList(List<PokemonElement> pokemonslist) {
    mycustomlist = pokemonslist;
  }

  addInMyCustomGlobalLists(List<PokemonElement> pokemonslist) {
    allMyLists.add(pokemonslist);
  }

  addInNameLists(String name) {
    listsNames.add(name);
  }

  List<List<PokemonElement>> get allLists => allMyLists;
  List<String> get getNamesMyLists => listsNames;
}
