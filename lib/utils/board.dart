import 'package:cosmic_tic_tac_toe/states/states.dart';

class Board {
  static Board? _instance;
  static Board get instance {
    return _instance ??= Board._();
  }

  final List<PlayerType?> board = List.generate(9, (i) => null);

  Board._();

  void restart([game = false]) {
    restartState.value += 1;
    _clearBoard();
    if (game) {
      roundState.value = 0;
      planetWinState.value = 0;
      starWinState.value = 0;
    }
  }

  void _clearBoard() {
    board.clear();
    board.addAll(List.generate(9, (i) => null));
    winState.value = null;
  }

  void add(int index, PlayerType type) {
    board[index] = type;
    final isMatched = check(index, type);
    if (isMatched) {
      if (type == PlayerType.planet) {
        planetWinState.value += 1;
      } else {
        starWinState.value += 1;
      }
      roundState.value += 1;
      winState.value = type;
    } else {
      if (board.every((e) => e != null)) {
        Future.delayed(const Duration(milliseconds: 400)).then((value) {
          drawState.value += 1;
          _clearBoard();
        });
      }
      playerState.value =
          playerState.value == PlayerType.planet ? PlayerType.star : PlayerType.planet;
    }
  }

  bool check(int index, PlayerType type) {
    final checkMaps = _checkMap[index]!;
    for (var i = 0; i < checkMaps.length; i++) {
      if (_check(type, checkMaps[i])) return true;
    }
    return false;
  }

  bool _check(PlayerType type, List<int> ii, [int i = 0]) {
    final isMatched = instance.board[ii[i]] == type;
    if (isMatched && i < 2) {
      return isMatched && _check(type, ii, i + 1);
    } else {
      return isMatched;
    }
  }

  // i know it's dumb, but bear with me
  final _checkMap = {
    0: [
      [0, 1, 2],
      [0, 3, 6],
      [0, 4, 8]
    ],
    1: [
      [0, 1, 2],
      [1, 4, 7]
    ],
    2: [
      [0, 1, 2],
      [3, 5, 8],
      [2, 4, 6]
    ],
    3: [
      [3, 4, 5],
      [0, 3, 6],
    ],
    4: [
      [3, 4, 5],
      [1, 4, 7],
      [2, 4, 6],
      [0, 4, 8]
    ],
    5: [
      [3, 4, 5],
      [2, 5, 8]
    ],
    6: [
      [6, 7, 8],
      [0, 3, 6],
      [2, 4, 6]
    ],
    7: [
      [6, 7, 8],
      [1, 4, 7]
    ],
    8: [
      [6, 7, 8],
      [2, 5, 8],
      [0, 4, 8]
    ],
  };
}
