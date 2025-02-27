import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voleibolteamcreator/enums/page_enum.dart';
import 'package:voleibolteamcreator/viewmodels/home_viewmodel.dart';
import 'package:voleibolteamcreator/viewmodels/players_viewmodel.dart';
import 'package:voleibolteamcreator/views/players_screen.dart';
import 'package:voleibolteamcreator/views/teams_screen.dart';
import 'package:voleibolteamcreator/views/widgets/bottom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        height: 90.0,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            BottomButton(
              title: "Equipos",
              icon: const Icon(Icons.group, color: Colors.indigo, size: 28),
              onPressed: () => {homeViewModel.moveToTeamsView()},
            ),
            BottomButton(
                title: "Jugadores",
                icon: const Icon(Icons.person, color: Colors.indigo, size: 28),
                onPressed: () => {homeViewModel.moveToPlayersView()}),
          ],
        ),
      ),
      body: SafeArea(child: getCurrentPage(homeViewModel.currentPage)),
    );
  }

  Widget getCurrentPage(PageEnum currentPage) {
    return currentPage == PageEnum.teamsScreen
        ? const TeamsScreen()
        : MultiProvider(providers: [
            ChangeNotifierProvider(create: (_) => PlayersViewModel())
          ], child: const PlayersScreen());
  }
}
