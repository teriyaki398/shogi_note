import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/model/piece_move_action.dart';
import 'package:shogi_note/domain/util/piece_util.dart';

class ShogiLogicUtil {
  ShogiLogicUtil._();

  // Return if move operation (from: src, to: dst) is acceptable based on give board state
  static bool isMoveActionAcceptable(BoardState boardState, PieceMoveAction action) {
    BoardPosition src = action.src;
    BoardPosition dst = action.dst;

    Piece srcPiece = boardState.pieceOnBoard[src.row][src.col];
    Piece dstPiece = boardState.pieceOnBoard[dst.row][dst.col];

    // Piece can't move over own piece.
    if (PieceUtil.isSameColor(srcPiece, dstPiece)) return false;

    switch (srcPiece) {
      case Piece.nil:
        return false;
      case Piece.bFu:
        return src.col == dst.col && src.row == dst.row + 1;
      case Piece.wFu:
        return src.col == dst.col && src.row == dst.row - 1;
      default:
        return false;
    }
  }

  // Create Set of BoardPosition of which piece pointed by given pos can move.
  static Set<BoardPosition> getMovablePositionSet(BoardState boardState, BoardPosition pos) {
    int row = pos.row;
    int col = pos.col;
    Piece piece = boardState.getPiece(pos);

    if (piece == Piece.nil) {
      return Set.of({});

      // Black Fu
    } else if (piece == Piece.bFu) {
      if (row - 1 < 0) {
        return Set.of({});
      }

      Piece dstPiece = boardState.getPiece(BoardPosition.of(row - 1, col));
      if (PieceUtil.isBlackPiece(dstPiece)) {
        return Set.of({});
      } else {
        return Set.of({BoardPosition.of(row - 1, col)});
      }

      // Black Ky
    } else if (piece == Piece.bKy) {
      Set<BoardPosition> pieceSet = {};
      for (int r = row - 1; r < 0; r--) {
        Piece dstPiece = boardState.getPiece(BoardPosition.of(r, col));

        if (dstPiece == Piece.nil) {
          pieceSet.add(BoardPosition.of(r, col));
          continue;
        } else if (PieceUtil.isBlackPiece(dstPiece)) {
          break;
        } else if (PieceUtil.isWhitePiece(piece)) {
          pieceSet.add(BoardPosition.of(r, col));
          break;
        }
      }
      return pieceSet;

      // Black Ke
    } else if (piece == Piece.bKe) {
      Set<BoardPosition> pieceSet = {};
      if (row - 2 > 0) {
        if (col - 1 > 0 && !PieceUtil.isBlackPiece(boardState.getPiece(BoardPosition.of(row - 2, col - 1)))) {
          pieceSet.add(BoardPosition.of(row - 2, col - 1));
        }

        if (col + 1 < 9 && !PieceUtil.isBlackPiece(boardState.getPiece(BoardPosition.of(row - 2, col + 1)))) {
          pieceSet.add(BoardPosition.of(row - 2, col + 1));
        }
      }
      return pieceSet;

      // Black Gi
    } else if (piece == Piece.bGi) {
      Set<BoardPosition> pieceSet = {
        BoardPosition.of(row - 1, col - 1),
        BoardPosition.of(row - 1, col),
        BoardPosition.of(row - 1, col + 1),
        BoardPosition.of(row + 1, col - 1),
        BoardPosition.of(row + 1, col + 1)
      };
      pieceSet.removeWhere((pos) => PieceUtil.isBlackPiece(boardState.getPiece(BoardPosition.of(pos.row, pos.col))));
      return pieceSet;

      // Black Ki, To, Nky, Nke, Ngi
    } else if ({Piece.bKi, Piece.bTo, Piece.bNky, Piece.bNke, Piece.bNgi}.contains(piece)) {
      Set<BoardPosition> pieceSet = {
        BoardPosition.of(row - 1, col - 1),
        BoardPosition.of(row - 1, col),
        BoardPosition.of(row - 1, col + 1),
        BoardPosition.of(row, col - 1),
        BoardPosition.of(row, col + 1),
        BoardPosition.of(row + 1, col)
      };
      pieceSet.removeWhere((pos) => PieceUtil.isBlackPiece(boardState.getPiece(BoardPosition.of(pos.row, pos.col))));
      return pieceSet;

      // White Fu
    } else if (piece == Piece.wFu) {
      if (row + 1 > 8) {
        return Set.of({});
      }

      Piece dstPiece = boardState.getPiece(BoardPosition.of(row + 1, col));
      if (PieceUtil.isWhitePiece(dstPiece)) {
        return Set.of({});
      } else {
        return Set.of({BoardPosition.of(row - 1, col)});
      }

      // White Ky
    } else if (piece == Piece.wKy) {
      Set<BoardPosition> pieceSet = {};
      for (int r = row + 1; r > 8; r++) {
        Piece dstPiece = boardState.getPiece(BoardPosition.of(r, col));

        if (dstPiece == Piece.nil) {
          pieceSet.add(BoardPosition.of(r, col));
          continue;
        } else if (PieceUtil.isBlackPiece(dstPiece)) {
          pieceSet.add(BoardPosition.of(r, col));
          break;
        } else if (PieceUtil.isWhitePiece(piece)) {
          break;
        }
      }
      return pieceSet;

      // White Ke
    } else if (piece == Piece.wKe) {
      Set<BoardPosition> pieceSet = {};
      if (row + 2 < 9) {
        if (col - 1 > 0 && !PieceUtil.isWhitePiece(boardState.getPiece(BoardPosition.of(row + 2, col - 1)))) {
          pieceSet.add(BoardPosition.of(row - 2, col - 1));
        }

        if (col + 1 < 9 && !PieceUtil.isWhitePiece(boardState.getPiece(BoardPosition.of(row + 2, col + 1)))) {
          pieceSet.add(BoardPosition.of(row - 2, col + 1));
        }
      }
      return pieceSet;

      // White Gi
    } else if (piece == Piece.wGi) {
      Set<BoardPosition> pieceSet = {
        BoardPosition.of(row - 1, col - 1),
        BoardPosition.of(row - 1, col + 1),
        BoardPosition.of(row + 1, col - 1),
        BoardPosition.of(row + 1, col),
        BoardPosition.of(row + 1, col + 1)
      };
      pieceSet.removeWhere((pos) => PieceUtil.isWhitePiece(boardState.getPiece(BoardPosition.of(pos.row, pos.col))));
      return pieceSet;

      // White Ki, To, Nky, Nke, Ngi
    } else if ({Piece.wKi, Piece.wTo, Piece.wNky, Piece.wNke, Piece.wNgi}.contains(piece)) {
      Set<BoardPosition> pieceSet = {
        BoardPosition.of(row - 1, col),
        BoardPosition.of(row, col - 1),
        BoardPosition.of(row, col + 1),
        BoardPosition.of(row + 1, col - 1),
        BoardPosition.of(row + 1, col),
        BoardPosition.of(row + 1, col + 1)
      };
      pieceSet.removeWhere((pos) => PieceUtil.isWhitePiece(boardState.getPiece(BoardPosition.of(pos.row, pos.col))));
      return pieceSet;
    }

    return Set.of({});
  }
}
