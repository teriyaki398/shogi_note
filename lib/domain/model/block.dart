import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'board_state.dart';

class Block {
  final String blockId;
  final List<BoardState> boardStateList;
  final String comment;

  Block({required this.blockId, required this.boardStateList, required this.comment});

  @override
  operator ==(other) =>
      other is Block &&
      other.blockId == blockId &&
      listEquals(other.boardStateList, boardStateList) &&
      other.comment == comment;

  @override
  int get hashCode => hashValues(blockId, hashList(boardStateList), comment);

  @override
  String toString() {
    return "Block(blockId:$blockId, sfenList:$boardStateList, comment:$comment)";
  }
}
