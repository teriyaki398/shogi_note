import 'package:flutter/material.dart';
import 'package:shogi_note/domain/builder/block_builder.dart';
import 'package:shogi_note/domain/builder/board_state_builder.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/model/piece_move_action.dart';
import 'package:shogi_note/domain/util/piece_util.dart';
import 'package:shogi_note/domain/util/shogi_logic_util.dart';
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
  /// Logic for handling user input by clicking board cell.
  ///
  /// BuildContext is used for launching Dialog.
  Future<void> onClickBoardCell(BoardPosition pos, BuildContext context) async {
    // TODO: Consider user can input move action with overwriting
    if (_displayBoardStateIndex != _block.lastIndex) {
      return;
    }

    // Initial holding operation
    if (_holdingPos == null) {
      bool isHoldablePiece = currentBoardState.color == ActiveColor.black
          ? PieceUtil.isBlackPiece(currentBoardState.getPiece(pos))
          : PieceUtil.isWhitePiece(currentBoardState.getPiece(pos));

      if (isHoldablePiece) {
        _holdingPos = pos;
        notifyListeners();
      }
      return;
    }

    // Cancel if same position is clicked
    if (pos == _holdingPos) {
      _holdingPos = null;
      notifyListeners();
      return;
    }

    // Consume holdingPos and apply move action if possible
    PieceMoveAction action = PieceMoveAction(src: _holdingPos!, dst: pos);

    if (ShogiLogicUtil.isAcceptableMoveAction(currentBoardState, action)) {
      if (ShogiLogicUtil.isPromotableAction(currentBoardState.getPiece(action.src), action)) {
        bool doPromote = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text("成りますか？"),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text('成る'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('成らない'),
                      )
                    ],
                  );
                }) ??
            false;

        // TODO: Implement forcible promotion.
        action = PieceMoveAction(src: action.src, dst: action.dst, promote: doPromote);
      }

      BoardState newBoardState = (BoardStateBuilder.ofState(currentBoardState)..movePiece(action)).build();
      _block = (BlockBuilder.ofBlock(_block)..addBoardState(newBoardState)).build();
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
