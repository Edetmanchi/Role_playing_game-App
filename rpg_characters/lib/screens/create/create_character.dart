import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rpg_characters/models/vocation.dart';
import 'package:rpg_characters/models/character.dart';
import 'package:rpg_characters/screens/create/vocation_card.dart';
import 'package:rpg_characters/screens/home/home.dart';
import 'package:rpg_characters/shared/styled_buttons.dart';
import 'package:rpg_characters/shared/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpg_characters/theme/theme.dart';
import 'package:uuid/Uuid.dart'; 
 
       

var uuid = const Uuid();

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
        // alert dislog for form control
        showDialog(context: context, builder: (ctx){
          return AlertDialog(

            // styling to overide the default colors for ddialog (Alternatively, this has been defined in the theeme file)
            // backgroundColor: AppColors.secondaryColor,
            // surfaceTintColor: Colors.transparent,
            
            title:const StyledHeading('Character Name missing'),
            content: const StyledText('Every good character need a name ...'),
            actions: [
              StyledButton(
                onPressed: (){
                  Navigator.pop(ctx);
                }, 
                child: const StyledText('Close'))
            ],
            actionsAlignment: MainAxisAlignment.center,


          );
        });
        return;

      }
      if(_sloganControllers.text.trim().isEmpty){
        // alert dislog for form control
        showDialog(context: context, builder: (ctx) {
          return AlertDialog(
            
            // styling to overide the default colors for ddialog (Alternatively, this has been defined in the theeme file)
            // backgroundColor: AppColors.secondaryColor,
            // surfaceTintColor: Colors.transparent,
            title: const StyledHeading('Missing character Slogan'),
            content:const  StyledText('Every character need a good slogan'),
            actions: [
              StyledButton(
                onPressed: (){
                  Navigator.pop(ctx);

                }, 
                child: const Text('Close'))
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        });
        return;
      }


      // function to create new character when form is submitted using uuid
      characters.add(Character(
        name: _textControllers.text.trim(),
        slogan: _sloganControllers.text.trim(),
        vocation: selectedVocation,
        id: uuid.v4()
      ));

      Navigator.push(context, MaterialPageRoute(
        builder: (ctx) => const Home())) ;
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
                      selected: selectedVocation == Vocation.raider,
                      onTap: updateVocation,
                      vocation: Vocation.raider,
                    ),
                    VocationCard(
                      selected: selectedVocation == Vocation.junkie,
                      onTap: updateVocation,
                      vocation: Vocation.junkie,
                    ),
                    VocationCard(
                      selected: selectedVocation == Vocation.ninja,
                      onTap: updateVocation,
                      vocation: Vocation.ninja,
                    ),
                    VocationCard(
                      selected: selectedVocation == Vocation.wizard,
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