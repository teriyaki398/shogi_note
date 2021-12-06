import 'package:quiver/iterables.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/model/piece_move_action.dart';

class BoardStateBuilder {
  static BoardStateBuilder? _singleton;

  static BoardStateBuilder instance() {
    _singleton ??= BoardStateBuilder._();
    return _singleton!;
  }

  BoardStateBuilder._();

  // Create new BoardState object by given boardState and move input data
  // TODO: Implementation is not completed
  BoardState movePiece(BoardState boardState, PieceMoveAction action) {
    List<List<Piece>> pieceOnBoard = range(boardState.pieceOnBoard.length).map((i) {
      return range(boardState.pieceOnBoard[i as int].length).map((j) {
        return boardState.pieceOnBoard[i][j as int];
      }).toList();
    }).toList();

    pieceOnBoard[action.dst.row][action.dst.col] = pieceOnBoard[action.src.row][action.src.col];
    pieceOnBoard[action.src.row][action.src.col] = Piece.nil;

    ActiveColor switchedColor = boardState.color == ActiveColor.black ? ActiveColor.white : ActiveColor.white;

    return BoardState(
        pieceOnBoard: pieceOnBoard, bHolder: boardState.bHolder, wHolder: boardState.wHolder, color: switchedColor);
  }
}
