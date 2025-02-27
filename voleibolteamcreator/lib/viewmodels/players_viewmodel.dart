import 'package:flutter/material.dart';
import 'package:voleibolteamcreator/enums/position_enum.dart';
import 'package:voleibolteamcreator/models/player.dart';

class PlayersViewModel extends ChangeNotifier {
  final List<Player> _players = [
    Player(
        id: '1',
        name: 'Roy Padilla',
        attack: 1,
        defense: 2,
        serve: 3,
        set: 1,
        position: PositionEnum.setter,
        speed: 1,
        control: 3),
    Player(
        id: '2',
        name: 'Jafeth Padilla',
        attack: 1,
        defense: 2,
        serve: 3,
        set: 1,
        position: PositionEnum.libero,
        speed: 1,
        control: 3),
  ];

  List<Player> get players => _players;
}
