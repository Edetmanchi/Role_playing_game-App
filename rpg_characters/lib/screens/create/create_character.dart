import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rpg_characters/models/vocation.dart';
import 'package:rpg_characters/screens/create/vocation_card.dart';
import 'package:rpg_characters/shared/styled_buttons.dart';
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



    handleFormSubmit(){
      if(_textControllers.text.trim().isEmpty){
        print('Error, Please enter name');
        return;

      }
      if(_sloganControllers.text.trim().isEmpty){
        print('Eror, please enter slogan');
        return;
      }
      return;
    }

     // ontap function that triggers when the vocation card is fired
      Vocation selectedVocation = Vocation.junkie;
    void updateVocation (Vocation vocation){
      setState(() {
        selectedVocation = vocation;
      });

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
        child: SingleChildScrollView(
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
                  ),
          
                  const SizedBox(height: 25,),
                  const Center(child:
                    StyledHeading('Create Vocation'),
                  ),
                  const Center(child:
                    StyledText('This Determine Your Available skills'),
                  ),
                  const SizedBox(height: 17,),
          
                    // calling the each charater with thier vocations fron the vocation card
                    VocationCard(
                      onTap: updateVocation,
                      vocation: Vocation.raider,
                    ),
                    VocationCard(
                      onTap: updateVocation,
                      vocation: Vocation.junkie,
                    ),
                    VocationCard(
                      onTap: updateVocation,
                      vocation: Vocation.ninja,
                    ),
                    VocationCard(
                      onTap: updateVocation,
                      vocation: Vocation.wizard,
                    ),
                
                  StyledButton(
                    onPressed: handleFormSubmit, 
                    child:const StyledText('Create Character')
                  )
          
                ],
              ),
          
            ),
        ),
        
        ),
      );
  }
}