import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character,{super.key});
  final String character;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Row(
          children: [
            Text(character),

            const Expanded(
              child: SizedBox()
            ),


            const Icon(
              Icons.arrow_right_alt,
              color:  Colors.white
            ),
          ],
        ),
      ),
    );
  }
}