import 'package:flutter/foundation.dart';
import 'package:shogi_note/domain/builder/block_builder.dart';
import 'package:shogi_note/domain/builder/board_state_builder.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/model/piece_move_action.dart';
import 'package:shogi_note/domain/util/shogi_logic_util.dart';

class BlockController with ChangeNotifier {
  Block _block;
  int _displayBoardStateIndex = 0;
  BoardPosition? _heldPos;

  final BlockBuilder _blockBuilder = BlockBuilder.instance();
  final BoardStateBuilder _boardStateBuilder = BoardStateBuilder.instance();

  BlockController({required Block block}) : _block = block;

  Block get block => _block;

  String get displayComment => _block.comment;

  BoardState get currentBoardState => _block.boardStateList[_displayBoardStateIndex];

  // TODO: Implementation is not completed
  void onClickBoardCell(BoardPosition pos) {
    // TODO: Consider user can input move action with overwriting
    if (_displayBoardStateIndex != _block.lastIndex) {
      return;
    }

    // Initial holding operation
    if (_heldPos == null) {
      if (currentBoardState.getPiece(pos) == Piece.nil) {
        return;
      }
      _heldPos = pos;
      notifyListeners();
      return;
    }

    // Cancel if same position is clicked
    if (pos == _heldPos) {
      _heldPos = null;
      notifyListeners();
      return;
    }

    // Consume heldPos and apply move action
    PieceMoveAction action = PieceMoveAction(src: _heldPos!, dst: pos);
    if (ShogiLogicUtil.isMoveActionAcceptable(currentBoardState, action)) {
      BoardState newBoardState = _boardStateBuilder.movePiece(currentBoardState, action);
      _block = _blockBuilder.addBoardState(_block, newBoardState);
      _displayBoardStateIndex += 1;
    }
    _heldPos = null;
    notifyListeners();
  }

  bool isClickedCell(BoardPosition pos) {
    return _heldPos == pos;
  }

  void onClickNextButton() {
    if (_displayBoardStateIndex >= _block.boardStateList.length - 1) {
      return;
    }
    _displayBoardStateIndex += 1;
    notifyListeners();
  }

  void onClickBackButton() {
    if (_displayBoardStateIndex <= 0) {
      return;
    }
    _displayBoardStateIndex -= 1;
    notifyListeners();
  }

  void onClickFirstButton() {
    _displayBoardStateIndex = 0;
    notifyListeners();
  }

  void onClickLastButton() {
    _displayBoardStateIndex = _block.boardStateList.length - 1;
    notifyListeners();
  }
}
