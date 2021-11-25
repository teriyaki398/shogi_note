import 'package:shogi_note/domain/const/piece.dart';

class PieceTypeMaps {
  static const List<PieceType> resources = [
    PieceType(piece: Piece.none, sfenShortChr: null),
    PieceType(piece: Piece.sFu, sfenShortChr: 'P'),
    PieceType(piece: Piece.gFu, sfenShortChr: 'p'),
  ];

  static final Map<String?, Piece> sfenShortChrToPieceMap = {
    for (var v in resources) v.sfenShortChr: v.piece
  };

  static Piece? getPieceFromShortSfenChr(String? shortSfenChr) {
    return sfenShortChrToPieceMap[shortSfenChr];
  }
}

class PieceType {
  final Piece piece;
  final String? sfenShortChr;

  const PieceType({required this.piece, required this.sfenShortChr});
}
