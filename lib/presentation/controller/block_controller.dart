import 'package:flutter/foundation.dart';
import 'package:shogi_note/domain/builder/block_builder.dart';
import 'package:shogi_note/domain/builder/board_state_builder.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/logic/shogi_logic.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/model/piece_move_action.dart';
import 'package:shogi_note/presentation/const/block_mode.dart';

class BlockController with ChangeNotifier {
  BlockMode _blockMode = BlockMode.read;

  Block _block;
  int _displayBoardStateIndex = 0;
  BoardPosition? _holdingPos;

  BlockController({required Block block}) : _block = block;

  BlockMode get blockMode => _blockMode;

  Block get block => _block;

  BoardState get currentBoardState => _block.boardStateList[_displayBoardStateIndex];

  void update(Block block) {
    _block = block;
    _displayBoardStateIndex = 0;
    _holdingPos = null;
  }

  // TODO: Implementation is not completed
  void onClickBoardCell(BoardPosition pos) {
    // TODO: Consider user can input move action with overwriting
    if (_displayBoardStateIndex != _block.lastIndex) {
      return;
    }

    // Initial holding operation
    if (_holdingPos == null) {
      if (currentBoardState.getPiece(pos) == Piece.nil) {
        return;
      }
      _holdingPos = pos;
      notifyListeners();
      return;
    }

    // Cancel if same position is clicked
    if (pos == _holdingPos) {
      _holdingPos = null;
      notifyListeners();
      return;
    }

    // Consume holdingPos and apply move action
    PieceMoveAction action = PieceMoveAction(src: _holdingPos!, dst: pos);

    if (ShogiLogic.isMoveActionAcceptable(currentBoardState, action)) {
      BoardStateBuilder newBoardState = BoardStateBuilder.ofState(currentBoardState)..movePiece(action);
      BlockBuilder block = BlockBuilder.ofBlock(_block)..addBoardState(newBoardState.build());
      _block = block.build();
      _displayBoardStateIndex += 1;
    }

    _holdingPos = null;
    notifyListeners();
  }

  void onClickEditButton() {
    _blockMode = BlockMode.edit;
    notifyListeners();
  }

  void onClickSaveButton() {
    _blockMode = BlockMode.read;
    notifyListeners();
  }

  bool isClickedCell(BoardPosition pos) {
    return _holdingPos == pos;
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
