import 'package:shogi_note/domain/const/piece.dart';

class PieceVariantMaps {
  PieceVariantMaps._();

  static const List<_PieceVariant> resources = [
    _PieceVariant(piece: Piece.nil, sfenChr: null, displayChr: null),
    _PieceVariant(piece: Piece.bFu, sfenChr: 'P', displayChr: '歩'),
    _PieceVariant(piece: Piece.bKy, sfenChr: 'L', displayChr: '香'),
    _PieceVariant(piece: Piece.bKe, sfenChr: 'N', displayChr: '桂'),
    _PieceVariant(piece: Piece.bGi, sfenChr: 'S', displayChr: '銀'),
    _PieceVariant(piece: Piece.bKi, sfenChr: 'G', displayChr: '金'),
    _PieceVariant(piece: Piece.bKa, sfenChr: 'B', displayChr: '角'),
    _PieceVariant(piece: Piece.bHi, sfenChr: 'R', displayChr: '飛'),
    _PieceVariant(piece: Piece.bTo, sfenChr: '+P', displayChr: 'と'),
    _PieceVariant(piece: Piece.bNy, sfenChr: '+L', displayChr: '杏'),
    _PieceVariant(piece: Piece.bNe, sfenChr: '+N', displayChr: '圭'),
    _PieceVariant(piece: Piece.bNg, sfenChr: '+S', displayChr: '全'),
    _PieceVariant(piece: Piece.bUm, sfenChr: '+B', displayChr: '馬'),
    _PieceVariant(piece: Piece.bRy, sfenChr: '+R', displayChr: '龍'),
    _PieceVariant(piece: Piece.bOu, sfenChr: 'K', displayChr: '玉'),
    _PieceVariant(piece: Piece.wFu, sfenChr: 'p', displayChr: '歩'),
    _PieceVariant(piece: Piece.wKy, sfenChr: 'l', displayChr: '香'),
    _PieceVariant(piece: Piece.wKe, sfenChr: 'n', displayChr: '桂'),
    _PieceVariant(piece: Piece.wGi, sfenChr: 's', displayChr: '銀'),
    _PieceVariant(piece: Piece.wKi, sfenChr: 'g', displayChr: '金'),
    _PieceVariant(piece: Piece.wKa, sfenChr: 'b', displayChr: '角'),
    _PieceVariant(piece: Piece.wHi, sfenChr: 'r', displayChr: '飛'),
    _PieceVariant(piece: Piece.wTo, sfenChr: '+p', displayChr: 'と'),
    _PieceVariant(piece: Piece.wNy, sfenChr: '+l', displayChr: '杏'),
    _PieceVariant(piece: Piece.wNe, sfenChr: '+n', displayChr: '圭'),
    _PieceVariant(piece: Piece.wNg, sfenChr: '+s', displayChr: '全'),
    _PieceVariant(piece: Piece.wUm, sfenChr: '+b', displayChr: '馬'),
    _PieceVariant(piece: Piece.wRy, sfenChr: '+r', displayChr: '龍'),
    _PieceVariant(piece: Piece.wOu, sfenChr: 'k', displayChr: '玉'),
  ];

  static final Map<String?, Piece> _sfenChrToPieceMap = {for (_PieceVariant e in resources) e.sfenChr: e.piece};
  static final Map<Piece, String?> _pieceToDisplayChrMap = {for (_PieceVariant e in resources) e.piece: e.displayChr};

  static Piece sfenChrToPiece(String? shortSfenChr) {
    return _sfenChrToPieceMap[shortSfenChr] ?? Piece.nil;
  }

  static String? pieceToDisplayChr(Piece piece) {
    return _pieceToDisplayChrMap[piece];
  }
}

class _PieceVariant {
  final Piece piece;
  final String? sfenChr;
  final String? displayChr;

  const _PieceVariant({required this.piece, required this.sfenChr, required this.displayChr});
}
