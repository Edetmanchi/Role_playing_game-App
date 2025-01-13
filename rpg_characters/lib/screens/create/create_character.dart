import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rpg_characters/shared/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpg_characters/theme/theme.dart';         


class CreateCharacter extends StatefulWidget {
  const CreateCharacter({super.key});

  @override
  State<CreateCharacter> createState() => _CreateCharacterState();
}

class _CreateCharacterState extends State<CreateCharacter> {
  final _textControllers = TextEditingController();
  final _sloganControllers = TextEditingController();
  // dispose function helps to overide the controllers and remove them from the build tree in compile time to save memory.
    @override
    void dispose() {
      _textControllers;
      _sloganControllers;
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Create your Character'),
        centerTitle: true,
      ),
      body: 
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.code, color: Colors.orange[50]),
              const StyledHeading('Welcome, new player'),
              const StyledText('Create a name & slogan for your Character'),
              const Padding(padding:EdgeInsets.only(bottom: 20)),
              TextField(
                // cotrollers works like unchange function to track text input
                controller: _textControllers,
                style: 
                  GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium
                  ),
                  cursorColor: AppColors.textColor,
                decoration:const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Enter a name'),
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _sloganControllers,
                style: 
                  GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium
                  ),
                  cursorColor: AppColors.textColor,
                decoration:const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Enter a name'),
                ),
              )


            ],
          ),

        ),

      )
      ,
    );
  }
}