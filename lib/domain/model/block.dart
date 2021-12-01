import 'package:equatable/equatable.dart';

import 'board_state.dart';

class Block extends Equatable {
  final String blockId;
  final List<BoardState> boardStateList;
  final String comment;
  final List<String> nextBlockIdList;

  const Block(
      {required this.blockId, required this.boardStateList, required this.comment, required this.nextBlockIdList});

  @override
  List<Object?> get props => [blockId, boardStateList, comment];
}
