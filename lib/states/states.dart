import 'package:flutter/material.dart';

enum PlayerType { planet, star }

final playerState = ValueNotifier(PlayerType.planet);

final winState = ValueNotifier<PlayerType?>(null);

final roundState = ValueNotifier(0);
final drawState = ValueNotifier(0);
final restartState = ValueNotifier(0);
final planetWinState = ValueNotifier(0);
final starWinState = ValueNotifier(0);
