import 'package:flutter/foundation.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_state.dart';

class BlockController with ChangeNotifier {
  final Block block;

  BlockController({required this.block});

  BoardState get boardState => block.boardStateList[0];
}
