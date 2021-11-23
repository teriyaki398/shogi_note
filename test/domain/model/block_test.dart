import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/model/block.dart';

Future main() async {
  test('equality test', () {
    Block src = Block(blockId: "cf84afbe-9b06-495e-9887-9bf7e6114406");
    Block src2 = Block(blockId: "894f1344-7af5-4694-8f97-c705b9318803");
    Block src3 = Block(blockId: "cf84afbe-9b06-495e-9887-9bf7e6114406");

    expect(src == src2, isFalse);
    expect(src == src3, isTrue);
  });

  test('string test', () {
    Block src = Block(blockId: "cf84afbe-9b06-495e-9887-9bf7e6114406");
    expect(src.toString(), "Block(blockId:cf84afbe-9b06-495e-9887-9bf7e6114406)");
  });
}
