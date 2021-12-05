import 'package:equatable/equatable.dart';

import 'board_state.dart';

class Block extends Equatable {
  final String blockId;
  final List<BoardState> boardStateList;
  final String comment;

  const Block({required this.blockId, required this.boardStateList, required this.comment});

  @override
  List<Object?> get props => [blockId, boardStateList, comment];

  BoardState get lastBoardState => boardStateList[boardStateList.length - 1];
}
