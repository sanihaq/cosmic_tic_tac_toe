import 'package:cosmic_tic_tac_toe/utils/board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

import '../assets/constants.dart';
import '../states/states.dart';
import '../widgets/planet.dart';
import '../widgets/score_text.dart';
import '../widgets/star.dart';

class WhosTurnIsIt extends StatelessWidget {
  const WhosTurnIsIt({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    final isPlanet = playerState.reactiveValue(context) == PlayerType.planet;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size * 0.3,
          child: Stack(
            children: [
              if (isPlanet)
                Center(child: Image.asset(kTurnBackgroundPlanet))
              else
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset(kTurnHollowPlanet),
                )),
              const ScoreText(type: PlayerType.planet),
              if (isPlanet)
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: PlanetWidget(scale: 1.5),
                ),
            ],
          ),
        ),
        SizedBox(
          width: size * 0.33,
          child: Transform.scale(
            scale: 0.6,
            child: InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                if (Board.instance.board.every((el) => el == null)) {
                  playerState.value = playerState.value == PlayerType.planet
                      ? PlayerType.star
                      : PlayerType.planet;
                }
              },
              child: Image.asset(kSwitchButton),
            ),
          ),
        ),
        SizedBox(
          width: size * 0.33,
          child: Stack(
            children: [
              if (!isPlanet)
                Center(child: Image.asset(kTurnBackgroundStar))
              else
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset(kTurnHollowStar),
                )),
              const ScoreText(type: PlayerType.star),
              if (!isPlanet)
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: StarWidget(scale: 1.5),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
