import 'package:flutter/material.dart';
import 'package:rpg_characters/screens/create/create_character.dart';
import 'package:rpg_characters/screens/home/home.dart';
import 'package:rpg_characters/theme/theme.dart';

void main(){
  runApp(MaterialApp(
    theme: primaryTheme,
    home:const Home(),
    // home:const CreateCharacter(),
  ));
}