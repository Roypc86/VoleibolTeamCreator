import 'package:voleibolteamcreator/enums/position_enum.dart';

class Player {
  final String id;
  final String name;
  final double attack;
  final double defense;
  final double serve;
  final double set;
  PositionEnum position;
  final int experience;
  final int speed;
  final int control;

  Player({
    required this.id,
    required this.name,
    required this.attack,
    required this.defense,
    required this.serve,
    required this.set,
    required this.position,
    required this.speed,
    required this.control,
    this.experience = 0,
  });

  // factory Player.fromFirestore(DocumentSnapshot doc) {
  //   Map data = doc.data() as Map;
  //   return Player(
  //     id: doc.id,
  //     name: data['name'] ?? '',
  //     attack: data['attack']?.toDouble() ?? 0.0,
  //     defense: data['defense']?.toDouble() ?? 0.0,
  //     serve: data['serve']?.toDouble() ?? 0.0,
  //     set: data['set']?.toDouble() ?? 0.0,
  //     position: data['position'] ?? PositionEnum.hitter,
  //     experience: data['experience'] ?? 0,
  //     speed: data['speed']?.toDouble() ?? 0.0,
  //     control: data['speed']?.toDouble() ?? 0.0,
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'attack': attack,
      'defense': defense,
      'serve': serve,
      'set': set,
      'position': position,
      'experience': experience,
      'speed': speed,
      'control': control
    };
  }

  static double _parseDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return 0.0;
  }
}
