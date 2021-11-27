import 'package:shogi_note/domain/const/piece.dart';

class PieceVarietyMaps {
  static const List<PieceVariety> resources = [
    PieceVariety(piece: Piece.none, sfenChr: null),
    PieceVariety(piece: Piece.bFu, sfenChr: 'P'),
    PieceVariety(piece: Piece.bKy, sfenChr: 'L'),
    PieceVariety(piece: Piece.bKe, sfenChr: 'N'),
    PieceVariety(piece: Piece.bGi, sfenChr: 'S'),
    PieceVariety(piece: Piece.bKi, sfenChr: 'G'),
    PieceVariety(piece: Piece.bKa, sfenChr: 'B'),
    PieceVariety(piece: Piece.bHi, sfenChr: 'R'),
    PieceVariety(piece: Piece.bTo, sfenChr: '+P'),
    PieceVariety(piece: Piece.bNky, sfenChr: '+L'),
    PieceVariety(piece: Piece.bNke, sfenChr: '+N'),
    PieceVariety(piece: Piece.bNgi, sfenChr: '+S'),
    PieceVariety(piece: Piece.bUm, sfenChr: '+B'),
    PieceVariety(piece: Piece.bRy, sfenChr: '+R'),
    PieceVariety(piece: Piece.bOu, sfenChr: 'K'),
    PieceVariety(piece: Piece.wFu, sfenChr: 'p'),
    PieceVariety(piece: Piece.wKy, sfenChr: 'l'),
    PieceVariety(piece: Piece.wKe, sfenChr: 'n'),
    PieceVariety(piece: Piece.wGi, sfenChr: 's'),
    PieceVariety(piece: Piece.wKi, sfenChr: 'g'),
    PieceVariety(piece: Piece.wKa, sfenChr: 'b'),
    PieceVariety(piece: Piece.wHi, sfenChr: 'r'),
    PieceVariety(piece: Piece.wTo, sfenChr: '+p'),
    PieceVariety(piece: Piece.wNky, sfenChr: '+l'),
    PieceVariety(piece: Piece.wNke, sfenChr: '+n'),
    PieceVariety(piece: Piece.wNgi, sfenChr: '+s'),
    PieceVariety(piece: Piece.wUm, sfenChr: '+b'),
    PieceVariety(piece: Piece.wRy, sfenChr: '+r'),
    PieceVariety(piece: Piece.wOu, sfenChr: 'k'),
  ];

  static final Map<String?, Piece> sfenChrToPieceMap = {
    for (PieceVariety e in resources) e.sfenChr: e.piece
  };

  static Piece getPieceFromSfenChr(String? shortSfenChr) {
    Piece? piece = sfenChrToPieceMap[shortSfenChr];
    if (piece == null) {
      return Piece.none;
    } else {
      return piece;
    }
  }
}

class PieceVariety {
  final Piece piece;
  final String? sfenChr;

  const PieceVariety({required this.piece, required this.sfenChr});
}
