import 'package:flutter/material.dart';
import 'package:voleibolteamcreator/views/widgets/bottom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.black,
        height: 90.0,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            BottomButton(
              title: "Equipos",
              icon: Icon(Icons.group, color: Colors.indigo, size: 28),
            ),
            BottomButton(
              title: "Jugadores",
              icon: Icon(Icons.person, color: Colors.indigo, size: 28),
            ),
          ],
        ),
      ),
      body: const SafeArea(child: Placeholder()),
    );
  }
}
