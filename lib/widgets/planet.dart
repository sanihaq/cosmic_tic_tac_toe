import 'package:flutter/material.dart';

import '../assets/constants.dart';

class PlanetWidget extends StatelessWidget {
  const PlanetWidget({
    super.key,
    this.scale = 1.4,
  });
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Opacity(
            opacity: 0.4,
            child: Transform.scale(
              scale: scale,
              child: Image.asset(kPlanetShadow),
            ),
          ),
        ),
        Center(
          child: Transform.scale(
            scale: scale,
            child: Image.asset(kPlanet),
          ),
        ),
      ],
    );
  }
}
