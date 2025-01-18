import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_characters/screens/create/create_character.dart';
import 'package:rpg_characters/screens/home/home.dart';
import 'package:rpg_characters/theme/theme.dart';
import 'package:rpg_characters/utilities/character_store.dart';
// firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// .
void main() async{
  // function to initiate network request between app and firebase(make it an async function)
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
// wrap the material App provider with the change provider bilder so you can have access to the global state accress the app
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home:const Home(),
      // home:const CreateCharacter(),
    ),
  ));
}