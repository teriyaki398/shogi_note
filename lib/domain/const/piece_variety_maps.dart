import 'package:shogi_note/domain/const/piece.dart';

class PieceVarietyMaps {
  static const List<PieceVariety> resources = [
    PieceVariety(piece: Piece.nil, sfenChr: null, displayChr: null),
    PieceVariety(piece: Piece.bFu, sfenChr: 'P', displayChr: '歩'),
    PieceVariety(piece: Piece.bKy, sfenChr: 'L', displayChr: '香'),
    PieceVariety(piece: Piece.bKe, sfenChr: 'N', displayChr: '桂'),
    PieceVariety(piece: Piece.bGi, sfenChr: 'S', displayChr: '銀'),
    PieceVariety(piece: Piece.bKi, sfenChr: 'G', displayChr: '金'),
    PieceVariety(piece: Piece.bKa, sfenChr: 'B', displayChr: '角'),
    PieceVariety(piece: Piece.bHi, sfenChr: 'R', displayChr: '飛'),
    PieceVariety(piece: Piece.bTo, sfenChr: '+P', displayChr: 'と'),
    PieceVariety(piece: Piece.bNky, sfenChr: '+L', displayChr: '杏'),
    PieceVariety(piece: Piece.bNke, sfenChr: '+N', displayChr: '圭'),
    PieceVariety(piece: Piece.bNgi, sfenChr: '+S', displayChr: '全'),
    PieceVariety(piece: Piece.bUm, sfenChr: '+B', displayChr: '馬'),
    PieceVariety(piece: Piece.bRy, sfenChr: '+R', displayChr: '龍'),
    PieceVariety(piece: Piece.bOu, sfenChr: 'K', displayChr: '玉'),
    PieceVariety(piece: Piece.wFu, sfenChr: 'p', displayChr: '歩'),
    PieceVariety(piece: Piece.wKy, sfenChr: 'l', displayChr: '香'),
    PieceVariety(piece: Piece.wKe, sfenChr: 'n', displayChr: '桂'),
    PieceVariety(piece: Piece.wGi, sfenChr: 's', displayChr: '銀'),
    PieceVariety(piece: Piece.wKi, sfenChr: 'g', displayChr: '金'),
    PieceVariety(piece: Piece.wKa, sfenChr: 'b', displayChr: '角'),
    PieceVariety(piece: Piece.wHi, sfenChr: 'r', displayChr: '飛'),
    PieceVariety(piece: Piece.wTo, sfenChr: '+p', displayChr: 'と'),
    PieceVariety(piece: Piece.wNky, sfenChr: '+l', displayChr: '杏'),
    PieceVariety(piece: Piece.wNke, sfenChr: '+n', displayChr: '圭'),
    PieceVariety(piece: Piece.wNgi, sfenChr: '+s', displayChr: '全'),
    PieceVariety(piece: Piece.wUm, sfenChr: '+b', displayChr: '馬'),
    PieceVariety(piece: Piece.wRy, sfenChr: '+r', displayChr: '龍'),
    PieceVariety(piece: Piece.wOu, sfenChr: 'k', displayChr: '玉'),
  ];

  static final Map<String?, Piece> _sfenChrToPieceMap = {for (PieceVariety e in resources) e.sfenChr: e.piece};

  static final Map<Piece, String?> _pieceToDisplayChrMap = {for (PieceVariety e in resources) e.piece: e.displayChr};

  PieceVarietyMaps._();

  static Piece getPieceFromSfenChr(String? shortSfenChr) {
    Piece? piece = _sfenChrToPieceMap[shortSfenChr];
    if (piece == null) {
      return Piece.nil;
    } else {
      return piece;
    }
  }

  static String? pieceToDisplayChr(Piece piece) {
    return _pieceToDisplayChrMap[piece];
  }
}

class PieceVariety {
  final Piece piece;
  final String? sfenChr;
  final String? displayChr;

  const PieceVariety({required this.piece, required this.sfenChr, required this.displayChr});
}
