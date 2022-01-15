import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/util/shogi_logic_util.dart';

void main() {
  test('Um getMovablePositionSet', () {
    // Black piece test
    BoardState bsBlackDstNil = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bUm, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogicUtil.getMovablePositionSet(bsBlackDstNil, BoardPosition(4, 4)), {
      BoardPosition(0, 0),
      BoardPosition(0, 8),
      BoardPosition(1, 1),
      BoardPosition(1, 7),
      BoardPosition(2, 2),
      BoardPosition(2, 6),
      BoardPosition(3, 3),
      BoardPosition(3, 4),
      BoardPosition(3, 5),
      BoardPosition(4, 3),
      BoardPosition(4, 5),
      BoardPosition(5, 3),
      BoardPosition(5, 4),
      BoardPosition(5, 5),
      BoardPosition(6, 2),
      BoardPosition(6, 6),
      BoardPosition(7, 1),
      BoardPosition(7, 7),
      BoardPosition(8, 0),
      BoardPosition(8, 8),
    });

    BoardState bsBlackDstPiece = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.bFu, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bFu, Piece.bFu, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.wFu, Piece.bUm, Piece.bFu, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wFu, Piece.wFu, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.wFu, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogicUtil.getMovablePositionSet(bsBlackDstPiece, BoardPosition(4, 4)), {
      BoardPosition(3, 3),
      BoardPosition(4, 3),
      BoardPosition(5, 3),
      BoardPosition(5, 4),
      BoardPosition(5, 5),
      BoardPosition(6, 2),
    });

    BoardState bsBlackOutOfBounds = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bUm],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogicUtil.getMovablePositionSet(bsBlackOutOfBounds, BoardPosition(0, 8)), {
      BoardPosition(0, 7),
      BoardPosition(1, 7),
      BoardPosition(1, 8),
      BoardPosition(2, 6),
      BoardPosition(3, 5),
      BoardPosition(4, 4),
      BoardPosition(5, 3),
      BoardPosition(6, 2),
      BoardPosition(7, 1),
      BoardPosition(8, 0),
    });

    BoardState bsBlackOutOfBounds2 = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.bUm, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogicUtil.getMovablePositionSet(bsBlackOutOfBounds2, BoardPosition(8, 0)), {
      BoardPosition(0, 8),
      BoardPosition(1, 7),
      BoardPosition(2, 6),
      BoardPosition(3, 5),
      BoardPosition(4, 4),
      BoardPosition(5, 3),
      BoardPosition(6, 2),
      BoardPosition(7, 0),
      BoardPosition(7, 1),
      BoardPosition(8, 1),
    });

    // White piece test
    BoardState bsWhiteDstNil = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wUm, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteDstNil, BoardPosition(4, 4)), {
      BoardPosition(0, 0),
      BoardPosition(0, 8),
      BoardPosition(1, 1),
      BoardPosition(1, 7),
      BoardPosition(2, 2),
      BoardPosition(2, 6),
      BoardPosition(3, 3),
      BoardPosition(3, 4),
      BoardPosition(3, 5),
      BoardPosition(4, 3),
      BoardPosition(4, 5),
      BoardPosition(5, 3),
      BoardPosition(5, 4),
      BoardPosition(5, 5),
      BoardPosition(6, 2),
      BoardPosition(6, 6),
      BoardPosition(7, 1),
      BoardPosition(7, 7),
      BoardPosition(8, 0),
      BoardPosition(8, 8),
    });

    BoardState bsWhiteDstPiece = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.bFu, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bFu, Piece.bFu, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.wFu, Piece.wUm, Piece.bFu, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wFu, Piece.wFu, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.wFu, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteDstPiece, BoardPosition(4, 4)), {
      BoardPosition(2, 2),
      BoardPosition(3, 3),
      BoardPosition(3, 4),
      BoardPosition(3, 5),
      BoardPosition(4, 5),
      BoardPosition(5, 3),
    });

    BoardState bsWhiteOutOfBounds = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wUm],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteOutOfBounds, BoardPosition(0, 8)), {
      BoardPosition(0, 7),
      BoardPosition(1, 7),
      BoardPosition(1, 8),
      BoardPosition(2, 6),
      BoardPosition(3, 5),
      BoardPosition(4, 4),
      BoardPosition(5, 3),
      BoardPosition(6, 2),
      BoardPosition(7, 1),
      BoardPosition(8, 0),
    });

    BoardState bsWhiteOutOfBounds2 = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.wUm, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteOutOfBounds2, BoardPosition(8, 0)), {
      BoardPosition(0, 8),
      BoardPosition(1, 7),
      BoardPosition(2, 6),
      BoardPosition(3, 5),
      BoardPosition(4, 4),
      BoardPosition(5, 3),
      BoardPosition(6, 2),
      BoardPosition(7, 0),
      BoardPosition(7, 1),
      BoardPosition(8, 1),
    });
  });
}
