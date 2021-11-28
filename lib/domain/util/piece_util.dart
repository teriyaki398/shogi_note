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
}
