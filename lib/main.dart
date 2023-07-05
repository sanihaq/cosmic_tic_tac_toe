import 'package:cosmic_tic_tac_toe/utils/board.dart';
import 'package:window_manager/window_manager.dart' show windowManager;
import 'package:cosmic_tic_tac_toe/theme/constants.dart';
import 'package:flutter/material.dart';

import 'views/game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.setAlwaysOnTop(true);
  Board.instance;

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmic Tic Tac Toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: const TicTacToe(),
    );
  }
}
