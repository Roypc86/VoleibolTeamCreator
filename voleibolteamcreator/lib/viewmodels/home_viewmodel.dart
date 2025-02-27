import 'package:flutter/material.dart';
import 'package:voleibolteamcreator/enums/page_enum.dart';

class HomeViewModel with ChangeNotifier {
  PageEnum _currentPage = PageEnum.teamsScreen;

  //Getters
  PageEnum get currentPage => _currentPage;

  void moveToPlayersView() {
    _currentPage = PageEnum.playersScreen;
    notifyListeners();
  }

  void moveToTeamsView() {
    _currentPage = PageEnum.teamsScreen;
    notifyListeners();
  }
}
