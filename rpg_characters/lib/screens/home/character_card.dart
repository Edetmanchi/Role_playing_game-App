import 'package:flutter/material.dart';
import 'package:rpg_characters/models/character.dart';
import 'package:rpg_characters/screens/profile/profile.dart';
import 'package:rpg_characters/shared/styled_text.dart';


class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character,{super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Row(
          children: [
            Image.asset('assets/img/vocations/${character.vocation.image}',
              width: 50,
            ),

           const SizedBox(width: 50,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
              ],
            ),

            const Expanded(
              child: SizedBox()
            ),



            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => Profile(character: character)));

          
              }, 
              icon:const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              )
            )



          ],
        ),
      ),
    );
  }
}