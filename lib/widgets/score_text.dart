import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

import '../states/states.dart';

class ScoreText extends StatelessWidget {
  const ScoreText({super.key, required this.type});
  final PlayerType type;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${type == PlayerType.planet ? planetWinState.reactiveValue(context) : starWinState.reactiveValue(context)}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF4F5D64),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              '/${roundState.reactiveValue(context)}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF828B90),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
