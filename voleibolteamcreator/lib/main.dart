import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voleibolteamcreator/viewmodels/home_viewmodel.dart';
import 'package:voleibolteamcreator/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generador de Equipos Voleibol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
      ], child: const HomeScreen()),
    );
  }
}
