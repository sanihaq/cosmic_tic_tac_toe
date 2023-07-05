import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

import '../areas/whos_turn_is_it.dart';
import '../areas/win_banner.dart';
import '../assets/constants.dart';
import '../states/states.dart';
import '../utils/board.dart';
import '../widgets/button.dart';
import '../widgets/tile.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraint) {
            final double size =
                constraint.maxWidth > (200 * 3) ? 200 : constraint.maxWidth / 3;
            return Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: size * 3.16),
                    child: SizedBox(
                      height: size * 0.7,
                      child: WhosTurnIsIt(size: size),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size * 2.85, left: size * 2),
                    child: SizedBox(
                      child: Button(
                        label: 'RESTART',
                        onTap: Board.instance.restart,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: size * 2.5,
                    height: size * 2.5,
                    child: Stack(
                      children: [
                        Image.asset(kBoardBackground),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0, bottom: 4.0),
                            child: SizedBox(
                              width: size * 1.95,
                              height: size * 1.95,
                              child: GridView(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                children: List.generate(
                                  9,
                                  (index) => BoardTile(index: index),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4.5, bottom: 1.1),
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                kFrame,
                                width: size * 2.078,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (winState.reactiveValue(context) != null) const WinBanner(),
              ],
            );
          },
        ),
      ),
    );
  }
}
