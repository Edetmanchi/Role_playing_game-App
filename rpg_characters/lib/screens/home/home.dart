import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rpg_characters/shared/styledText.dart';

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
        title: const StyledHeading('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding:const EdgeInsets.all(20),
        child:Column(
          children: [
            const Text('Character Lists'),
            const StyledHeading('Character List'),
            const StyledTitle('Character List'),
            const StyledText('Character List'),
            FilledButton(
              onPressed:(){},
              child:const Text('Add character'))
          ],
        )
      ),
    );
  }
}