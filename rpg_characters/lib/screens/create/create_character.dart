import 'package:flutter/material.dart';
import 'package:rpg_characters/shared/styled_text.dart';

class CreateCharacter extends StatelessWidget {
  const CreateCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Create your Character'),
        centerTitle: true,
      ),
    );
  }
}