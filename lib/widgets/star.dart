import 'package:flutter/material.dart';

import '../assets/constants.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
    this.scale = 1.4,
  });
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Transform.scale(
            scale: scale,
            child: Image.asset(kStarShadow),
          ),
        ),
        Center(
          child: Transform.scale(
            scale: scale,
            child: Image.asset(kStar),
          ),
        ),
      ],
    );
  }
}
