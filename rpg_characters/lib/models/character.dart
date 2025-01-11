import 'package:rpg_characters/models/vocation.dart';
import 'package:rpg_characters/models/skill.dart';

class Character {
  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id

  });

  // fields
  final Set<Skill> skills ={};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  void toggleIsFav(){
    _isFav = !_isFav; 
  }

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}