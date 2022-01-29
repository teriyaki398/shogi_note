import 'package:quiver/iterables.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/model/piece_move_action.dart';

class BoardStateBuilder {
  BoardState _boardState;

  BoardStateBuilder.ofState(BoardState boardState) : _boardState = boardState;

  BoardStateBuilder.ofDefault()
      : _boardState = BoardState(
            pieceOnBoard: List.of([
              List.of(
                  [Piece.wKy, Piece.wKe, Piece.wGi, Piece.wKi, Piece.wOu, Piece.wKi, Piece.wGi, Piece.wKe, Piece.wKy]),
              List.of(
                  [Piece.nil, Piece.wHi, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKa, Piece.nil]),
              List.of(
                  [Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu]),
              List.of(
                  [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]),
              List.of(
                  [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]),
              List.of(
                  [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]),
              List.of(
                  [Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu]),
              List.of(
                  [Piece.nil, Piece.bKa, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bHi, Piece.nil]),
              List.of(
                  [Piece.bKy, Piece.bKe, Piece.bGi, Piece.bKi, Piece.bOu, Piece.bKi, Piece.bGi, Piece.bKe, Piece.bKy])
            ]),
            bHolder: List.empty(),
            wHolder: List.empty(),
            color: ActiveColor.black);

  BoardState build() {
    return _boardState;
  }

  // Create new BoardState object by given boardState and move input data
  // TODO: Implementation is not completed (need to consider promotion)
  void movePiece(PieceMoveAction action) {
    List<List<Piece>> pieceOnBoard = range(_boardState.pieceOnBoard.length).map((i) {
      return range(_boardState.pieceOnBoard[i as int].length).map((j) {
        return _boardState.pieceOnBoard[i][j as int];
      }).toList();
    }).toList();

    pieceOnBoard[action.dst.row][action.dst.col] = pieceOnBoard[action.src.row][action.src.col];
    pieceOnBoard[action.src.row][action.src.col] = Piece.nil;

    ActiveColor switchedColor = _boardState.color == ActiveColor.black ? ActiveColor.white : ActiveColor.black;
    _boardState = BoardState(
        pieceOnBoard: pieceOnBoard, bHolder: _boardState.bHolder, wHolder: _boardState.wHolder, color: switchedColor);
  }
}
