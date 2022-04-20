import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/const/piece_attributes.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/model/piece_move_action.dart';

class ShogiLogic {
  ShogiLogic._();

  // Return if move operation (from: src, to: dst) is acceptable for given board state.
  static bool isMoveActionAcceptable(BoardState boardState, PieceMoveAction action) {
    Set<BoardPosition> movablePositionSet = getMovablePositionSet(boardState, action.src);
    return movablePositionSet.contains(action.dst);
  }

  // Create Set of BoardPosition of which piece pointed by given pos can move.
  // - Active color (手番) is considered. That means if active color is black, white piece cannot move anywhere.
  // - "Check" or "Checkmate" are not considered.
  static Set<BoardPosition> getMovablePositionSet(BoardState boardState, BoardPosition pos) {
    int row = pos.row;
    int col = pos.col;
    Piece piece = boardState.getPiece(pos);

    if (piece == Piece.nil) {
      return {};

      // Piece color is not active color
    } else if (PieceAttributes.isBlackPiece(piece) && boardState.color == ActiveColor.white ||
        PieceAttributes.isWhitePiece(piece) && boardState.color == ActiveColor.black) {
      return {};

      // Black Fu
    } else if (piece == Piece.bFu) {
      if (row - 1 < 0) {
        return {};
      }

      Piece dstPiece = boardState.getPiece(BoardPosition(row - 1, col));
      if (PieceAttributes.isBlackPiece(dstPiece)) {
        return {};
      } else {
        return Set.of({BoardPosition(row - 1, col)});
      }

      // Black Ky
    } else if (piece == Piece.bKy) {
      Set<BoardPosition> pieceSet = {};
      for (int r = row - 1; r >= 0; r--) {
        Piece dstPiece = boardState.getPiece(BoardPosition(r, col));

        if (dstPiece == Piece.nil) {
          pieceSet.add(BoardPosition(r, col));
          continue;
        } else if (PieceAttributes.isBlackPiece(dstPiece)) {
          break;
        } else if (PieceAttributes.isWhitePiece(dstPiece)) {
          pieceSet.add(BoardPosition(r, col));
          break;
        }
      }
      return pieceSet;

      // Black Ke
    } else if (piece == Piece.bKe) {
      Set<BoardPosition> pieceSet = {};
      if (row - 2 > 0) {
        if (col - 1 > 0 && !PieceAttributes.isBlackPiece(boardState.getPiece(BoardPosition(row - 2, col - 1)))) {
          pieceSet.add(BoardPosition(row - 2, col - 1));
        }

        if (col + 1 < 9 && !PieceAttributes.isBlackPiece(boardState.getPiece(BoardPosition(row - 2, col + 1)))) {
          pieceSet.add(BoardPosition(row - 2, col + 1));
        }
      }
      return pieceSet;

      // Black Gi
    } else if (piece == Piece.bGi) {
      List<List<int>> possibleList = [
        [row - 1, col - 1],
        [row - 1, col],
        [row - 1, col + 1],
        [row + 1, col - 1],
        [row + 1, col + 1]
      ];
      possibleList.removeWhere((e) => !BoardPosition.isValidPosition(row: e[0], col: e[1]));
      Set<BoardPosition> pieceSet = possibleList.map((e) => BoardPosition(e[0], e[1])).toSet();

      pieceSet.removeWhere((pos) => PieceAttributes.isBlackPiece(boardState.getPiece(BoardPosition(pos.row, pos.col))));
      return pieceSet;

      // Black Ki, To, Nky, Nke, Ngi
    } else if ({Piece.bKi, Piece.bTo, Piece.bNy, Piece.bNe, Piece.bNg}.contains(piece)) {
      List<List<int>> possibleList = [
        [row - 1, col - 1],
        [row - 1, col],
        [row - 1, col + 1],
        [row, col - 1],
        [row, col + 1],
        [row + 1, col]
      ];
      possibleList.removeWhere((e) => !BoardPosition.isValidPosition(row: e[0], col: e[1]));
      Set<BoardPosition> pieceSet = possibleList.map((e) => BoardPosition(e[0], e[1])).toSet();

      pieceSet.removeWhere((pos) => PieceAttributes.isBlackPiece(boardState.getPiece(BoardPosition(pos.row, pos.col))));
      return pieceSet;

      // Black Ka
    } else if (piece == Piece.bKa) {
      return _getKakuMovablePosition(boardState, pos);

      // Black Hi
    } else if (piece == Piece.bHi) {
      return _getHishaMovablePosition(boardState, pos);

      // Black Um
    } else if (piece == Piece.bUm) {
      Set<BoardPosition> pieceSet = _getKakuMovablePosition(boardState, pos);
      pieceSet.addAll(_getOuMovablePosition(boardState, pos));
      return pieceSet;

      // Black Ry
    } else if (piece == Piece.bRy) {
      Set<BoardPosition> pieceSet = _getHishaMovablePosition(boardState, pos);
      pieceSet.addAll(_getOuMovablePosition(boardState, pos));
      return pieceSet;

      // Black Ou
    } else if (piece == Piece.bOu) {
      return _getOuMovablePosition(boardState, pos);

      // White Fu
    } else if (piece == Piece.wFu) {
      if (row + 1 > 8) {
        return {};
      }

      Piece dstPiece = boardState.getPiece(BoardPosition(row + 1, col));
      if (PieceAttributes.isWhitePiece(dstPiece)) {
        return {};
      } else {
        return Set.of({BoardPosition(row + 1, col)});
      }

      // White Ky
    } else if (piece == Piece.wKy) {
      Set<BoardPosition> pieceSet = {};
      for (int r = row + 1; r <= 8; r++) {
        Piece dstPiece = boardState.getPiece(BoardPosition(r, col));

        if (dstPiece == Piece.nil) {
          pieceSet.add(BoardPosition(r, col));
          continue;
        } else if (PieceAttributes.isBlackPiece(dstPiece)) {
          pieceSet.add(BoardPosition(r, col));
          break;
        } else if (PieceAttributes.isWhitePiece(dstPiece)) {
          break;
        }
      }
      return pieceSet;

      // White Ke
    } else if (piece == Piece.wKe) {
      Set<BoardPosition> pieceSet = {};
      if (row + 2 < 9) {
        if (col - 1 > 0 && !PieceAttributes.isWhitePiece(boardState.getPiece(BoardPosition(row + 2, col - 1)))) {
          pieceSet.add(BoardPosition(row + 2, col - 1));
        }

        if (col + 1 < 9 && !PieceAttributes.isWhitePiece(boardState.getPiece(BoardPosition(row + 2, col + 1)))) {
          pieceSet.add(BoardPosition(row + 2, col + 1));
        }
      }
      return pieceSet;

      // White Gi
    } else if (piece == Piece.wGi) {
      List<List<int>> possibleList = [
        [row - 1, col - 1],
        [row - 1, col + 1],
        [row + 1, col - 1],
        [row + 1, col],
        [row + 1, col + 1]
      ];
      possibleList.removeWhere((e) => !BoardPosition.isValidPosition(row: e[0], col: e[1]));
      Set<BoardPosition> pieceSet = possibleList.map((e) => BoardPosition(e[0], e[1])).toSet();

      pieceSet.removeWhere((pos) => PieceAttributes.isWhitePiece(boardState.getPiece(BoardPosition(pos.row, pos.col))));
      return pieceSet;

      // White Ki, To, Nky, Nke, Ngi
    } else if ({Piece.wKi, Piece.wTo, Piece.wNy, Piece.wNe, Piece.wNg}.contains(piece)) {
      List<List<int>> possibleList = [
        [row - 1, col],
        [row, col - 1],
        [row, col + 1],
        [row + 1, col - 1],
        [row + 1, col],
        [row + 1, col + 1]
      ];
      possibleList.removeWhere((e) => !BoardPosition.isValidPosition(row: e[0], col: e[1]));
      Set<BoardPosition> pieceSet = possibleList.map((e) => BoardPosition(e[0], e[1])).toSet();

      pieceSet.removeWhere((pos) => PieceAttributes.isWhitePiece(boardState.getPiece(BoardPosition(pos.row, pos.col))));
      return pieceSet;

      // White Ka
    } else if (piece == Piece.wKa) {
      return _getKakuMovablePosition(boardState, pos);

      // White Hi
    } else if (piece == Piece.wHi) {
      return _getHishaMovablePosition(boardState, pos);

      // White Um
    } else if (piece == Piece.wUm) {
      Set<BoardPosition> pieceSet = _getKakuMovablePosition(boardState, pos);
      pieceSet.addAll(_getOuMovablePosition(boardState, pos));
      return pieceSet;

      // White Ry
    } else if (piece == Piece.wRy) {
      Set<BoardPosition> pieceSet = _getHishaMovablePosition(boardState, pos);
      pieceSet.addAll(_getOuMovablePosition(boardState, pos));
      return pieceSet;

      // White Ou
    } else if (piece == Piece.wOu) {
      return _getOuMovablePosition(boardState, pos);
    }

    return {};
  }

  // Create movable position set dedicated to Piece.bKa or Piece.wKa
  static Set<BoardPosition> _getKakuMovablePosition(BoardState boardState, BoardPosition pos) {
    int row = pos.row;
    int col = pos.col;

    Set<BoardPosition> pieceSet = {};

    // ↖↖↖↖
    for (int i = 1; i < 9; i++) {
      if (row - i < 0 || col - i < 0) {
        break;
      }
      BoardPosition dstPos = BoardPosition(row - i, col - i);
      Piece dstPiece = boardState.getPiece(dstPos);
      if (dstPiece == Piece.nil) {
        pieceSet.add(dstPos);
      } else {
        if (PieceAttributes.isSameColor(boardState.getPiece(pos), dstPiece)) {
          break;
        } else {
          pieceSet.add(dstPos);
          break;
        }
      }
    }

    // ↗↗↗↗
    for (int i = 1; i < 9; i++) {
      if (row - i < 0 || col + i > 8) {
        break;
      }
      BoardPosition dstPos = BoardPosition(row - i, col + i);
      Piece dstPiece = boardState.getPiece(dstPos);
      if (dstPiece == Piece.nil) {
        pieceSet.add(dstPos);
      } else {
        if (PieceAttributes.isSameColor(boardState.getPiece(pos), dstPiece)) {
          break;
        } else {
          pieceSet.add(dstPos);
          break;
        }
      }
    }

    // ↘↘↘↘
    for (int i = 1; i < 9; i++) {
      if (row + i > 8 || col + i > 8) {
        break;
      }
      BoardPosition dstPos = BoardPosition(row + i, col + i);
      Piece dstPiece = boardState.getPiece(dstPos);
      if (dstPiece == Piece.nil) {
        pieceSet.add(dstPos);
      } else {
        if (PieceAttributes.isSameColor(boardState.getPiece(pos), dstPiece)) {
          break;
        } else {
          pieceSet.add(dstPos);
          break;
        }
      }
    }

    // ↙↙↙↙
    for (int i = 1; i < 9; i++) {
      if (row + i > 8 || col - i < 0) {
        break;
      }
      BoardPosition dstPos = BoardPosition(row + i, col - i);
      Piece dstPiece = boardState.getPiece(dstPos);
      if (dstPiece == Piece.nil) {
        pieceSet.add(dstPos);
      } else {
        if (PieceAttributes.isSameColor(boardState.getPiece(pos), dstPiece)) {
          break;
        } else {
          pieceSet.add(dstPos);
          break;
        }
      }
    }

    return pieceSet;
  }

  // Create movable position set dedicated to Piece.bHi or Piece.wHi
  static Set<BoardPosition> _getHishaMovablePosition(BoardState boardState, BoardPosition pos) {
    int row = pos.row;
    int col = pos.col;

    Set<BoardPosition> pieceSet = {};

    // ←←←←
    for (int i = 1; i < 9; i++) {
      if (col - i < 0) {
        break;
      }

      BoardPosition dstPos = BoardPosition(row, col - i);
      Piece dstPiece = boardState.getPiece(dstPos);
      if (dstPiece == Piece.nil) {
        pieceSet.add(dstPos);
      } else {
        if (PieceAttributes.isSameColor(boardState.getPiece(pos), dstPiece)) {
          break;
        } else {
          pieceSet.add(dstPos);
          break;
        }
      }
    }

    // ↑↑↑↑
    for (int i = 1; i < 9; i++) {
      if (row - i < 0) {
        break;
      }

      BoardPosition dstPos = BoardPosition(row - i, col);
      Piece dstPiece = boardState.getPiece(dstPos);
      if (dstPiece == Piece.nil) {
        pieceSet.add(dstPos);
      } else {
        if (PieceAttributes.isSameColor(boardState.getPiece(pos), dstPiece)) {
          break;
        } else {
          pieceSet.add(dstPos);
          break;
        }
      }
    }

    // →→→→
    for (int i = 1; i < 9; i++) {
      if (col + i > 8) {
        break;
      }

      BoardPosition dstPos = BoardPosition(row, col + i);
      Piece dstPiece = boardState.getPiece(dstPos);
      if (dstPiece == Piece.nil) {
        pieceSet.add(dstPos);
      } else {
        if (PieceAttributes.isSameColor(boardState.getPiece(pos), dstPiece)) {
          break;
        } else {
          pieceSet.add(dstPos);
          break;
        }
      }
    }

    // ↓↓↓↓
    for (int i = 1; i < 9; i++) {
      if (row + i > 8) {
        break;
      }

      BoardPosition dstPos = BoardPosition(row + i, col);
      Piece dstPiece = boardState.getPiece(dstPos);
      if (dstPiece == Piece.nil) {
        pieceSet.add(dstPos);
      } else {
        if (PieceAttributes.isSameColor(boardState.getPiece(pos), dstPiece)) {
          break;
        } else {
          pieceSet.add(dstPos);
          break;
        }
      }
    }

    return pieceSet;
  }

  static Set<BoardPosition> _getOuMovablePosition(BoardState boardState, BoardPosition pos) {
    int row = pos.row;
    int col = pos.col;

    List<List<int>> possibleList = [
      [row - 1, col - 1],
      [row - 1, col],
      [row - 1, col + 1],
      [row, col - 1],
      [row, col + 1],
      [row + 1, col - 1],
      [row + 1, col],
      [row + 1, col + 1]
    ];
    possibleList.removeWhere((e) => !BoardPosition.isValidPosition(row: e[0], col: e[1]));
    Set<BoardPosition> pieceSet = possibleList.map((e) => BoardPosition(e[0], e[1])).toSet();

    pieceSet.removeWhere((p) => PieceAttributes.isSameColor(boardState.getPiece(pos), boardState.getPiece(p)));
    return pieceSet;
  }
}
