import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/logic/shogi_logic.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';

void main() {
  test('Ke getMovablePositionSet', () {
    // Black piece test
    BoardState bsBlackDstNil = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bKe, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogic.getMovablePositionSet(bsBlackDstNil, BoardPosition(4, 4)),
        {BoardPosition(2, 3), BoardPosition(2, 5)});

    BoardState bsBlackDstPiece = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.bFu, Piece.nil, Piece.wFu, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bKe, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogic.getMovablePositionSet(bsBlackDstPiece, BoardPosition(4, 4)), {BoardPosition(2, 5)});

    BoardState bsBlackOutOfBounds = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bKe, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bKe, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);

    expect(ShogiLogic.getMovablePositionSet(bsBlackOutOfBounds, BoardPosition(1, 4)), <BoardPosition>{});
    expect(ShogiLogic.getMovablePositionSet(bsBlackOutOfBounds, BoardPosition(0, 4)), <BoardPosition>{});

    // White piece test
    BoardState bsWhiteDstNil = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKe, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogic.getMovablePositionSet(bsWhiteDstNil, BoardPosition(4, 4)),
        {BoardPosition(6, 3), BoardPosition(6, 5)});

    BoardState bsWhiteDstPiece = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKe, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.wFu, Piece.nil, Piece.bFu, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogic.getMovablePositionSet(bsWhiteDstPiece, BoardPosition(4, 4)), {BoardPosition(6, 5)});

    BoardState bsWhiteOutOfBounds = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKe, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKe, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);

    expect(ShogiLogic.getMovablePositionSet(bsWhiteOutOfBounds, BoardPosition(7, 4)), <BoardPosition>{});
    expect(ShogiLogic.getMovablePositionSet(bsWhiteOutOfBounds, BoardPosition(8, 4)), <BoardPosition>{});
  });
}
