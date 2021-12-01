import 'package:flutter/foundation.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_state.dart';

class BlockController with ChangeNotifier {
  final Block _block;
  int _stateIndex = 0;

  BlockController({required Block block}) : _block = block;

  String get comment => _block.comment;

  BoardState get currentBoardState => _block.boardStateList[_stateIndex];

  void onClickNextButton() {
    if (_stateIndex >= _block.boardStateList.length - 1) {
      return;
    }
    _stateIndex += 1;
    notifyListeners();
  }

  void onClickBackButton() {
    if (_stateIndex <= 0) {
      return;
    }
    _stateIndex -= 1;
    notifyListeners();
  }

  void onClickFirstButton() {
    _stateIndex = 0;
    notifyListeners();
  }

  void onClickLastButton() {
    _stateIndex = _block.boardStateList.length - 1;
    notifyListeners();
  }
}
