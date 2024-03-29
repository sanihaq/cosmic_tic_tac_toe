import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

import '../assets/constants.dart';
import '../states/states.dart';
import '../theme/constants.dart';
import '../utils/board.dart';
import '../widgets/button.dart';
import '../widgets/planet.dart';
import '../widgets/star.dart';

final _opacity = ValueNotifier(1.0);

class WinBanner extends StatelessWidget {
  const WinBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final winType = winState.reactiveValue(context);
    return Stack(
      children: [
        Container(
          color: winType == PlayerType.planet
              ? kWinBackgroundPlanet.withOpacity(0.4)
              : kWinBackgroundStar.withOpacity(0.4),
        ),
        Builder(builder: (context) {
          return Opacity(
            opacity: _opacity.reactiveValue(context),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13.0),
                    child: Transform.scale(
                      scale: 1.2,
                      child: Image.asset(
                        winType == PlayerType.planet ? kWinBannerPlanet : kWinBannerStar,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Center(
                    child: Text(
                      winType == PlayerType.planet ? 'PLANET WINS' : 'STAR WINS',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF4F5D64),
                        fontSize: 28,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 6,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          label: 'NEXT ROUND',
                          onTap: Board.instance.restart,
                        ),
                        const SizedBox(width: 12),
                        Button(
                          label: 'RESTART',
                          onTap: () => Board.instance.restart(true),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 145.0),
                    child: GestureDetector(
                      onTapDown: (_) {
                        _opacity.value = 0.6;
                      },
                      onTapUp: (_) {
                        _opacity.value = 1;
                      },
                      child: SizedBox(
                        height: 90,
                        child: winType == PlayerType.planet
                            ? const PlanetWidget()
                            : const StarWidget(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
