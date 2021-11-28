import 'package:flutter/foundation.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_state.dart';

class BlockController with ChangeNotifier {
  final Block block;
  int stateIndex;

  BlockController({required this.block, this.stateIndex = 0});

  BoardState get boardState => block.boardStateList[stateIndex];

  void onClickNextButton() {
    if (stateIndex >= block.boardStateList.length - 1) {
      return;
    }
    stateIndex += 1;
    notifyListeners();
  }

  void onClickBackButton() {
    if (stateIndex <= 0) {
      return;
    }
    stateIndex -= 1;
    notifyListeners();
  }

  void onClickFirstButton() {
    stateIndex = 0;
    notifyListeners();
  }

  void onClickLastButton() {
    stateIndex = block.boardStateList.length - 1;
    notifyListeners();
  }
}
