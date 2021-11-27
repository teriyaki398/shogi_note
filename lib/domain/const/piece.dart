enum Piece {
  none,
  bFu,
  bTo,
  bKy,
  bNky,
  bKe,
  bNke,
  bGi,
  bNgi,
  bKi,
  bKa,
  bUm,
  bHi,
  bRy,
  bOu,
  wFu,
  wTo,
  wKy,
  wNky,
  wKe,
  wNke,
  wGi,
  wNgi,
  wKi,
  wKa,
  wUm,
  wHi,
  wRy,
  wOu
}

class PieceConst {
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
}
