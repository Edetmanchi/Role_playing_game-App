import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_characters/screens/create/create_character.dart';
import 'package:rpg_characters/screens/home/character_card.dart';
import 'package:rpg_characters/shared/styled_buttons.dart';
import 'package:rpg_characters/shared/styled_text.dart';
import 'package:rpg_characters/utilities/character_store.dart';

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
              // wrapping the listview widget in a consumer widget so that we can have aaccess to the global state instaed of the importing the character file and using the date from there 
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    // after adding the global state, call the character values with .value as a method  ): easy right ?
                    itemCount: value.characters.length ,
                    itemBuilder: (_,index){
                      return CharacterCard(value.characters[index]);
                    }
                  );
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