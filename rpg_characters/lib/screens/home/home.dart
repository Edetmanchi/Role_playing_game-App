import 'package:flutter/material.dart';
import 'package:rpg_characters/screens/create/create_character.dart';
import 'package:rpg_characters/screens/home/character_card.dart';
import 'package:rpg_characters/shared/styled_appbar.dart';
import 'package:rpg_characters/shared/styled_buttons.dart';
import 'package:rpg_characters/shared/styled_text.dart';
import 'package:rpg_characters/models/character.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const StyledTitle('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding:const EdgeInsets.all(20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: characters.length ,
                itemBuilder: (_,index){
                  return CharacterCard(characters[index]);
                }
              ),
            ),

            


            StyledButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => const CreateCharacter()));
              },
              child:const StyledHeading('Add character'))
          ],
        )
      ),
    );
  }
}