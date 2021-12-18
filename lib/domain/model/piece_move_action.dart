import 'package:equatable/equatable.dart';
import 'package:shogi_note/domain/model/board_position.dart';

class PieceMoveAction extends Equatable {
  final BoardPosition src;
  final BoardPosition dst;
  final bool promote;

  const PieceMoveAction({required this.src, required this.dst, this.promote = false});

  @override
  List<Object?> get props => [src, dst, promote];
}
