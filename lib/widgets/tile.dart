import 'package:flutter/material.dart';

import '../assets/constants.dart';
import '../states/states.dart';
import '../utils/board.dart';

class BoardTile extends StatefulWidget {
  const BoardTile({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<BoardTile> createState() => _BoardTileState();
}

class _BoardTileState extends State<BoardTile> {
  bool isOnHover = false;
  bool isFilled = false;
  @override
  void initState() {
    super.initState();
    drawState.addListener(() {
      setState(() {
        isFilled = false;
      });
    });
    restartState.addListener(() {
      setState(() {
        isFilled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hover) {
        setState(() {
          isOnHover = hover;
        });
      },
      onTap: isFilled
          ? null
          : () {
              setState(() {
                isFilled = true;
              });
              Board.instance.add(widget.index, playerState.value);
            },
      child: Stack(
        children: [
          if (isFilled)
            Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Transform.scale(
                scale: 1.02,
                child: Image.asset(
                  Board.instance.board[widget.index] == PlayerType.star
                      ? kFillStar
                      : kFilledPlanet,
                ),
              ),
            )
          else
            Image.asset(kSlotBackground),
          if (isOnHover && !isFilled)
            Image.asset(
              playerState.value == PlayerType.planet ? kHoverPlanet : kHoverStar,
            ),
        ],
      ),
    );
  }
}
