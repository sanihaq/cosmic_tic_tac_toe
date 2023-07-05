import 'package:cosmic_tic_tac_toe/states/states.dart';
import 'package:cosmic_tic_tac_toe/utils/board.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Board _init() {
    final board = Board.instance;

    board.add(0, PlayerType.planet);
    board.add(1, PlayerType.planet);
    board.add(2, PlayerType.planet);
    return board;
  }

  test("board add", () {
    final board = _init();

    expect(board.board, List.generate(9, (i) => i < 3 ? PlayerType.planet : null));
  });

  test("board match", () {
    final board = _init();

    final isMatched = board.check(0, PlayerType.planet);

    expect(isMatched, isTrue);
  });
}
