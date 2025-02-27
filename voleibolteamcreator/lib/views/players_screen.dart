import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voleibolteamcreator/enums/position_enum.dart';
import 'package:voleibolteamcreator/models/player.dart';
import 'package:voleibolteamcreator/viewmodels/players_viewmodel.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playersViewModel = Provider.of<PlayersViewModel>(context);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: DataTable(
                columns: getColumns(),
                rows: getRows(playersViewModel.players))),
      ),
    );
  }

  List<DataColumn> getColumns() {
    return const [
      DataColumn(
        label: Expanded(
            child:
                Text('Nombre', style: TextStyle(fontStyle: FontStyle.italic))),
      ),
      DataColumn(
        label: Expanded(
            child: Text('Posicion',
                style: TextStyle(fontStyle: FontStyle.italic))),
      ),
      DataColumn(
        label: Expanded(
            child:
                Text('Score', style: TextStyle(fontStyle: FontStyle.italic))),
      ),
    ];
  }

  List<DataRow> getRows(List<Player> players) {
    List<DataRow> playersRows = [];
    int index = 0;
    for (Player player in players) {
      playersRows.add(
        DataRow(
          color: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (index % 2 == 1) return Colors.grey[200];
            return null;
          }),
          cells: [
            DataCell(
              Text(player.name),
            ),
            DataCell(
              Container(
                  width: 90,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: getColorByPosition(player.position)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    player.position.name.toString(),
                    style:
                        TextStyle(color: getColorByPosition(player.position)),
                    textAlign: TextAlign.center,
                  )),
            ),
            DataCell(
              Text(player.speed.toString()),
            ),
          ],
        ),
      );
      index++;
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
