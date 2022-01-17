import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/util/shogi_logic_util.dart';

void main() {
  test('nil getMovablePositionSet', () {
    BoardState bsBlackPieceNil = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.black);
    expect(ShogiLogicUtil.getMovablePositionSet(bsBlackPieceNil, BoardPosition(4, 4)), <BoardPosition>{});

    BoardState bsWhitePieceNil = BoardState(pieceOnBoard: const [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ], bHolder: List.empty(), wHolder: List.empty(), color: ActiveColor.white);
    expect(ShogiLogicUtil.getMovablePositionSet(bsWhitePieceNil, BoardPosition(4, 4)), <BoardPosition>{});
  });
}
