import 'package:shogi_note/domain/const/piece.dart';

class PiecePromotionMaps {
  PiecePromotionMaps._();

  static const List<_PiecePromotionVariant> resources = [
    _PiecePromotionVariant(orgPiece: Piece.bFu, promotedPiece: Piece.bTo),
    _PiecePromotionVariant(orgPiece: Piece.bKy, promotedPiece: Piece.bNy),
    _PiecePromotionVariant(orgPiece: Piece.bKe, promotedPiece: Piece.bNe),
    _PiecePromotionVariant(orgPiece: Piece.bGi, promotedPiece: Piece.bNg),
    _PiecePromotionVariant(orgPiece: Piece.bKa, promotedPiece: Piece.bUm),
    _PiecePromotionVariant(orgPiece: Piece.bHi, promotedPiece: Piece.bRy),
    _PiecePromotionVariant(orgPiece: Piece.wFu, promotedPiece: Piece.wTo),
    _PiecePromotionVariant(orgPiece: Piece.wKy, promotedPiece: Piece.wNy),
    _PiecePromotionVariant(orgPiece: Piece.wKe, promotedPiece: Piece.wNe),
    _PiecePromotionVariant(orgPiece: Piece.wGi, promotedPiece: Piece.wNg),
    _PiecePromotionVariant(orgPiece: Piece.wKa, promotedPiece: Piece.wUm),
    _PiecePromotionVariant(orgPiece: Piece.wHi, promotedPiece: Piece.wRy),
  ];

  static final Map<Piece, Piece> _orgToPromoted = {
    for (_PiecePromotionVariant e in resources) e.orgPiece: e.promotedPiece
  };

  static Piece doPromote(Piece org) {
    return _orgToPromoted[org] ?? org;
  }
}

class _PiecePromotionVariant {
  final Piece orgPiece;
  final Piece promotedPiece;

  const _PiecePromotionVariant({required this.orgPiece, required this.promotedPiece});
}
