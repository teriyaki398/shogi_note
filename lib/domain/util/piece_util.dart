import 'package:shogi_note/domain/const/piece.dart';

class PieceUtil {
  PieceUtil._();

  static const Set<Piece> _blackPieceSet = {
    Piece.bFu,
    Piece.bTo,
    Piece.bKy,
    Piece.bNky,
    Piece.bKe,
    Piece.bNke,
    Piece.bGi,
    Piece.bNgi,
    Piece.bKi,
    Piece.bKa,
    Piece.bUm,
    Piece.bHi,
    Piece.bRy,
    Piece.bOu
  };

  static const Set<Piece> _whitePieceSet = {
    Piece.wFu,
    Piece.wTo,
    Piece.wKy,
    Piece.wNky,
    Piece.wKe,
    Piece.wNke,
    Piece.wGi,
    Piece.wNgi,
    Piece.wKi,
    Piece.wKa,
    Piece.wUm,
    Piece.wHi,
    Piece.wRy,
    Piece.wOu
  };

  static Set<Piece> get blackPieceSet => _blackPieceSet;

  static Set<Piece> get whitePieceSet => _whitePieceSet;

  static bool isBlackPiece(Piece piece) {
    return _blackPieceSet.contains(piece);
  }

  static bool isWhitePiece(Piece piece) {
    return _whitePieceSet.contains(piece);
  }

  static bool isSameColor(Piece piece1, Piece piece2) {
    return isBlackPiece(piece1) && isBlackPiece(piece2) || isWhitePiece(piece1) && isWhitePiece(piece2);
  }
}
