import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/model/board_position.dart';

void main() {
  test('equality test', () {
    BoardPosition src1 = BoardPosition(0, 0);
    BoardPosition src2 = BoardPosition(0, 0);
    BoardPosition src3 = BoardPosition(0, 1);

    expect(src1 == src2, isTrue);
    expect(src1 == src3, isFalse);
  });

  test('getter test', () {
    BoardPosition src = BoardPosition(0, 1);
    expect(src.row, 0);
    expect(src.col, 1);
  });

  test('validation test', () {
    List<List<int>> invalidPositions = [
      [-1, 0],
      [0, -1],
      [-1, -1],
      [9, 0],
      [0, 9],
      [9, 9],
      [9, -1],
      [-1, 9]
    ];
    for (var e in invalidPositions) {
      expect(() => BoardPosition(e[0], e[1]), throwsA(const TypeMatcher<ArgumentError>()));
    }
  });
}
