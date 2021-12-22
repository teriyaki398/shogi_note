import 'package:shogi_note/domain/const/piece.dart';

class PieceUtil {
  PieceUtil._();

  static const Set<Piece> _blackPiece = {
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

  static const Set<Piece> _whitePiece = {
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

  static bool isBlackPiece(Piece piece) {
    return _blackPiece.contains(piece);
  }

  static bool isWhitePiece(Piece piece) {
    return _whitePiece.contains(piece);
  }

  static bool isSameColor(Piece piece1, Piece piece2) {
    if (piece1 == Piece.nil || piece2 == Piece.nil) {
      throw ArgumentError("Piece.nil cannot be compared");
    }
    return isBlackPiece(piece1) && isBlackPiece(piece2) || isWhitePiece(piece1) && isWhitePiece(piece2);
  }
}
