import 'package:shogi_note/domain/const/piece.dart';

class PieceUtil {
  static bool isBlackPiece(Piece piece) {
    return PieceConst.blackPiece.contains(piece);
  }

  static bool isWhitePiece(Piece piece) {
    return PieceConst.whitePiece.contains(piece);
  }
}
