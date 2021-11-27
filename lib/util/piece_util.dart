import 'package:shogi_note/domain/const/piece.dart';

class PieceUtil {
  static const Set<Piece> blackPiece = {
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

  static const Set<Piece> whitePiece = {
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
    return blackPiece.contains(piece);
  }

  static bool isWhitePiece(Piece piece) {
    return whitePiece.contains(piece);
  }
}
