import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voleibolteamcreator/enums/position_enum.dart';
import 'package:voleibolteamcreator/models/player.dart';
import 'package:voleibolteamcreator/viewmodels/players_viewmodel.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});
  static const double nameSizeFactor = 1 / 3;
  static const double positionSizeFactor = 1 / 4;
  static const double scoreSizeFactor = 1 / 4;
  @override
  Widget build(BuildContext context) {
    final playersViewModel = Provider.of<PlayersViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: DataTable(
              columnSpacing: 0,
              horizontalMargin: 0,
              columns: getColumns(screenWidth),
              rows: getRows(playersViewModel.players, screenWidth)),
        )),
      ),
    );
  }

  List<DataColumn> getColumns(double screenWidth) {
    return [
      DataColumn(
        label: SizedBox(
          width: screenWidth * nameSizeFactor,
          child: const Text(
            'Nombre',
            style: TextStyle(color: Colors.indigoAccent),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: screenWidth * positionSizeFactor,
          child: const Text(
            'Posicion',
            style: TextStyle(color: Colors.indigoAccent),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: screenWidth * scoreSizeFactor,
          child: const Text(
            'Puntuacion',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.indigoAccent),
          ),
        ),
      ),
    ];
  }

  List<DataRow> getRows(List<Player> players, double screenWidth) {
    List<DataRow> playersRows = [];

    for (Player player in players) {
      playersRows.add(
        DataRow(
          // color: WidgetStateProperty.resolveWith<Color?>(
          //     (Set<WidgetState> states) {
          //   if (pIndex % 2 == 1) {
          //     return Colors.grey[200];
          //   }
          //   return Colors.white; // Use the default value.
          // }),
          cells: [
            DataCell(
              SizedBox(
                width: screenWidth * (1 / 4),
                child: Text(
                  player.name,
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.white, overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            DataCell(
              Container(
                width: screenWidth * (1 / 4),
                //padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: getColorByPosition(player.position)),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  player.position.name.toString(),
                  style: TextStyle(
                      color: getColorByPosition(player.position),
                      overflow: TextOverflow.ellipsis),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DataCell(
              SizedBox(
                width: screenWidth * (1 / 4),
                child: Text(
                  player.speed.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return playersRows;
  }

  Color getColorByPosition(PositionEnum playerPosition) {
    switch (playerPosition) {
      case PositionEnum.hitter:
        return Colors.greenAccent;
      case PositionEnum.libero:
        return Colors.redAccent;
      case PositionEnum.setter:
        return Colors.blueAccent;
    }
  }
}
