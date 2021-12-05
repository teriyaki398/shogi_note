import 'package:flutter/foundation.dart';
import 'package:shogi_note/domain/builder/block_builder.dart';
import 'package:shogi_note/domain/builder/board_state_builder.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';

class BlockController with ChangeNotifier {
  Block _block;
  int _stateIndex = 0;
  BoardPosition? _clickedPos;

  final BlockBuilder _blockBuilder = BlockBuilder.instance();
  final BoardStateBuilder _boardStateBuilder = BoardStateBuilder.instance();

  BlockController({required Block block}) : _block = block;

  Block get block => _block;

  BoardState get currentBoardState => _block.boardStateList[_stateIndex];

  // TODO: Implementation is not completed
  void onClickBoardCell(BoardPosition pos) {
    if (_clickedPos == null) {
      _clickedPos = pos;
      notifyListeners();
      return;
    }

    if (pos == _clickedPos) {
      _clickedPos = null;
      notifyListeners();
      return;
    }

    BoardState newBoardState = _boardStateBuilder.movePiece(currentBoardState, _clickedPos!, pos);
    _block = _blockBuilder.addBoardState(_block, newBoardState);
    _stateIndex += 1;
    _clickedPos = null;
    notifyListeners();
  }

  bool isClickedCell(BoardPosition pos) {
    return _clickedPos == pos;
  }

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
