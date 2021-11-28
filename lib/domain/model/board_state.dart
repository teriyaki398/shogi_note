import 'package:equatable/equatable.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:tuple/tuple.dart';

class BoardState extends Equatable {
  final List<List<Piece>> pieceOnBoard;
  final List<Tuple2<Piece, int>> bHolder;
  final List<Tuple2<Piece, int>> wHolder;
  final ActiveColor color;

  const BoardState({required this.pieceOnBoard, required this.bHolder, required this.wHolder, required this.color});

  @override
  List<Object?> get props => [pieceOnBoard, bHolder, wHolder, color];
}
