import 'package:flutter/material.dart';
import 'package:rpg_characters/models/character.dart';
import 'package:rpg_characters/models/vocation.dart';
import 'package:rpg_characters/utilities/firestore_utils.dart';


class CharacterStore extends ChangeNotifier {

  // dummy character data
   final List<Character> _characters = [];

  // dummy data not longer needed was fetching from the database
    // final List<Character> _characters = [
    //   Character(id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Kapumf!'),
    //   Character(id: '2', name: 'Jonny', vocation: Vocation.junkie, slogan: 'Light me up...'),
    //   Character(id: '3', name: 'Crimson', vocation: Vocation.raider, slogan: 'Fire in the hole!'),
    //   Character(id: '4', name: 'Shaun', vocation: Vocation.ninja, slogan: 'Alright then gang.'),
    // ];
    get characters => _characters;

  // UTITLITIES FUNCTIONS

  // add parameter

  void addcharacter (Character, character) async{
    await FirestoreService.addCharacter(character);
    _characters.add(character);

    // method that notify the comsumers of this state when is it being changed or updated so that they can rebiuld the app tree
    notifyListeners();
  }


  // save (update ) character
  // remove character
  // initially fetch characters (when application first loads up)
  void fetchCharactersOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();
      
      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }

      notifyListeners();
    }
  }


}


