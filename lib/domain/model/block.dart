import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Block {
  final String blockId;
  final List<String> sfenList;
  final String comment;

  Block({required this.blockId, required this.sfenList, required this.comment});

  @override
  operator ==(other) =>
      other is Block &&
      other.blockId == blockId &&
      listEquals(other.sfenList, sfenList) &&
      other.comment == comment;

  @override
  int get hashCode => hashValues(blockId, hashList(sfenList), comment);

  @override
  String toString() {
    return "Block(blockId:$blockId, sfenList:$sfenList, comment:$comment)";
  }
}
