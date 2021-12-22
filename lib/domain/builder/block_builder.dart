import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_state.dart';

class BlockBuilder {
  Block _block;

  BlockBuilder.ofBlock(Block block) : _block = block;

  Block build() {
    return _block;
  }

  // Create new Block object based on given block
  // Add boardState as the last element of given Block object.
  void addBoardState(BoardState boardState) {
    List<BoardState> newBoardStateList = _block.boardStateList + [boardState];
    _block = Block(blockId: _block.blockId, boardStateList: newBoardStateList, comment: _block.comment);
  }
}
