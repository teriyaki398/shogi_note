import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/builder/board_state_builder.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:uuid/uuid.dart';

void main() {
  // TODO: Implement test
  test('BlockController test', () {
    BoardState boardState = BoardStateBuilder.ofDefault().build();
    Block block = Block(blockId: const Uuid().v4(), boardStateList: [boardState], comment: "test");
    BlockController blockController = BlockController(block: block);
  });
}
