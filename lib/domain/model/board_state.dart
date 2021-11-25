import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';

class BoardState {
  final List<List<Piece>> pieceOnBoard;
  final List<Piece> bHolder;
  final List<Piece> wHolder;
  final ActiveColor color;

  BoardState(
      {required this.pieceOnBoard,
      required this.bHolder,
      required this.wHolder,
      required this.color});
}
