
import 'package:flutter/material.dart';
import 'package:rpg_characters/screens/home/character_card.dart';
import 'package:rpg_characters/shared/styled_buttons.dart';
import 'package:rpg_characters/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List characters = ['Edet', 'Effiong', 'Table', 'Chair', 'church','party', 'xavier'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledHeading('Your Characters'),
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
              onPressed:(){},
              child:const StyledHeading('Add character'))
          ],
        )
      ),
    );
  }
}