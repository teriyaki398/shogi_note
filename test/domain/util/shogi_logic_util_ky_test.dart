import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/util/shogi_logic_util.dart';

void main() {
  test('Ky getMovablePositionSet', () {
    // Black piece test
    BoardState bsBlackDstNil = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bKy, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogicUtil.getMovablePositionSet(bsBlackDstNil, const BoardPosition(row: 8, col: 4)), {
      const BoardPosition(row: 7, col: 4),
      const BoardPosition(row: 6, col: 4),
      const BoardPosition(row: 5, col: 4),
      const BoardPosition(row: 4, col: 4),
      const BoardPosition(row: 3, col: 4),
      const BoardPosition(row: 2, col: 4),
      const BoardPosition(row: 1, col: 4),
      const BoardPosition(row: 0, col: 4),
    });

    BoardState bsBlackDstWhite = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wFu, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bKy, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogicUtil.getMovablePositionSet(bsBlackDstWhite, const BoardPosition(row: 8, col: 4)), {
      const BoardPosition(row: 7, col: 4),
      const BoardPosition(row: 6, col: 4),
      const BoardPosition(row: 5, col: 4),
      const BoardPosition(row: 4, col: 4),
      const BoardPosition(row: 3, col: 4),
      const BoardPosition(row: 2, col: 4),
      const BoardPosition(row: 1, col: 4),
      const BoardPosition(row: 0, col: 4),
    });

    BoardState bsBlackDstBlack = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bFu, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bKy, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogicUtil.getMovablePositionSet(bsBlackDstBlack, const BoardPosition(row: 8, col: 4)), {
      const BoardPosition(row: 7, col: 4),
      const BoardPosition(row: 6, col: 4),
      const BoardPosition(row: 5, col: 4),
      const BoardPosition(row: 4, col: 4),
      const BoardPosition(row: 3, col: 4),
      const BoardPosition(row: 2, col: 4),
      const BoardPosition(row: 1, col: 4),
    });

    BoardState bsBlackOutOfBounds = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bKy, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogicUtil.getMovablePositionSet(bsBlackOutOfBounds, const BoardPosition(row: 0, col: 4)),
        <BoardPosition>{});

    // White piece test
    BoardState bsWhiteDstNil = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKy, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteDstNil, const BoardPosition(row: 0, col: 4)), {
      const BoardPosition(row: 1, col: 4),
      const BoardPosition(row: 2, col: 4),
      const BoardPosition(row: 3, col: 4),
      const BoardPosition(row: 4, col: 4),
      const BoardPosition(row: 5, col: 4),
      const BoardPosition(row: 6, col: 4),
      const BoardPosition(row: 7, col: 4),
      const BoardPosition(row: 8, col: 4),
    });

    BoardState bsWhiteDstBlack = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKy, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bFu, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteDstBlack, const BoardPosition(row: 0, col: 4)), {
      const BoardPosition(row: 1, col: 4),
      const BoardPosition(row: 2, col: 4),
      const BoardPosition(row: 3, col: 4),
      const BoardPosition(row: 4, col: 4),
      const BoardPosition(row: 5, col: 4),
      const BoardPosition(row: 6, col: 4),
      const BoardPosition(row: 7, col: 4),
      const BoardPosition(row: 8, col: 4),
    });

    BoardState bsWhiteDstWhite = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKy, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wGi, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteDstWhite, const BoardPosition(row: 0, col: 4)), {
      const BoardPosition(row: 1, col: 4),
      const BoardPosition(row: 2, col: 4),
      const BoardPosition(row: 3, col: 4),
      const BoardPosition(row: 4, col: 4),
      const BoardPosition(row: 5, col: 4),
      const BoardPosition(row: 6, col: 4),
      const BoardPosition(row: 7, col: 4),
    });

    BoardState bsWhiteOutOfBounds = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKy, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteOutOfBounds, const BoardPosition(row: 8, col: 4)),
        <BoardPosition>{});
  });
}
