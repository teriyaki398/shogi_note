import 'package:equatable/equatable.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';

class BoardState extends Equatable {
  final List<List<Piece>> pieceOnBoard;
  final List<Piece> bHolder;
  final List<Piece> wHolder;
  final ActiveColor color;

  const BoardState({required this.pieceOnBoard, required this.bHolder, required this.wHolder, required this.color});

  @override
  // TODO: implement props
  List<Object?> get props => [pieceOnBoard, bHolder, wHolder, color];
}
