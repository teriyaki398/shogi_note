import 'package:shogi_note/domain/const/piece.dart';

class PieceUtil {
  PieceUtil._();

  static const Set<Piece> _blackPieceSet = {
    Piece.bFu,
    Piece.bTo,
    Piece.bKy,
    Piece.bNy,
    Piece.bKe,
    Piece.bNe,
    Piece.bGi,
    Piece.bNg,
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
    Piece.wNy,
    Piece.wKe,
    Piece.wNe,
    Piece.wGi,
    Piece.wNg,
    Piece.wKi,
    Piece.wKa,
    Piece.wUm,
    Piece.wHi,
    Piece.wRy,
    Piece.wOu
  };

  static const Set<Piece> _promotablePiece = {
    Piece.bFu,
    Piece.bKy,
    Piece.bKe,
    Piece.bGi,
    Piece.bKa,
    Piece.bHi,
    Piece.wFu,
    Piece.wKy,
    Piece.wKe,
    Piece.wGi,
    Piece.wKa,
    Piece.wHi,
  };

  static Set<Piece> get blackPieceSet => _blackPieceSet;

  static Set<Piece> get whitePieceSet => _whitePieceSet;

  static bool isBlackPiece(Piece piece) {
    return _blackPieceSet.contains(piece);
  }

  static bool isWhitePiece(Piece piece) {
    return _whitePieceSet.contains(piece);
  }

  static bool isPromotablePiece(Piece piece) {
    return _promotablePiece.contains(piece);
  }

  static bool isSameColor(Piece piece1, Piece piece2) {
    return isBlackPiece(piece1) && isBlackPiece(piece2) || isWhitePiece(piece1) && isWhitePiece(piece2);
  }
}
