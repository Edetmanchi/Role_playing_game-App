import 'package:flutter/material.dart';
import 'package:rpg_characters/models/vocation.dart';
import 'package:rpg_characters/shared/styled_text.dart';
import 'package:rpg_characters/theme/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,  
    required this.selected,
    });

    final Vocation vocation;
    final void Function(Vocation) onTap;
    final bool selected;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(vocation);
        print('character has been clicked ${vocation.title}');
      },
      child: Card(
        color: selected ? AppColors.secondaryColor : AppColors.secondaryColor2,
        child: Padding(
            padding:const EdgeInsets.all(8),
            child: Row(
              children: [
                Image.asset('assets/img/vocations/${vocation.image}',
                width: 80,
                // color: !selected ? Colors.black.withOpacity(0.7) : Colors.transparent,
                color: selected ? Colors.transparent : Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.color,
                ),
      
                const SizedBox(width: 5,),
      
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(vocation.title),
                        StyledText(vocation.description,),
                  
                      ],
                    ),
                )
              ],
      
      
            ),
          ),
      ),
    );
    
  }
}