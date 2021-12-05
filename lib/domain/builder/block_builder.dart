import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_state.dart';

class BlockBuilder {
  static BlockBuilder? _singleton;

  static BlockBuilder instance() {
    _singleton ??= BlockBuilder._();
    return _singleton!;
  }

  BlockBuilder._();

  // Create new Block object based on given block
  // Add boardState as the last element of given Block object.
  Block addBoardState(Block block, BoardState boardState) {
    List<BoardState> newBoardStateList = block.boardStateList + [boardState];
    return Block(blockId: block.blockId, boardStateList: newBoardStateList, comment: block.comment);
  }
}
