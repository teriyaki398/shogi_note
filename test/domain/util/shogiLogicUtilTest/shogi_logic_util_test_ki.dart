import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/util/shogi_logic_util.dart';
import 'package:tuple/tuple.dart';

void main() {
  // Generate test board state
  // pieceSet: Set of combination of BoardPosition and Piece. Consume this for placing piece on board
  BoardState _generateBoardState(Set<Tuple2<Piece, BoardPosition>> pieceSet, ActiveColor color) {
    List<List<Piece>> pieceOnBoard = [
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.bKi, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil]
    ];

    for (Tuple2<Piece, BoardPosition> pieceAndPosition in pieceSet) {
      BoardPosition pos = pieceAndPosition.item2;
      pieceOnBoard[pos.row][pos.col] = pieceAndPosition.item1;
    }

    return BoardState(pieceOnBoard: pieceOnBoard, bHolder: List.empty(), wHolder: List.empty(), color: color);
  }

  test('Black Ki/To/Ny/Ne/Ng getMovablePositionSet', () {
    for (Piece p in {Piece.bKi, Piece.bTo, Piece.bNy, Piece.bNe, Piece.bNg}) {
      BoardState bsBlackDstNil =
          _generateBoardState({Tuple2(p, const BoardPosition(row: 4, col: 4))}, ActiveColor.black);

      expect(ShogiLogicUtil.getMovablePositionSet(bsBlackDstNil, const BoardPosition(row: 4, col: 4)), {
        const BoardPosition(row: 3, col: 3),
        const BoardPosition(row: 3, col: 4),
        const BoardPosition(row: 3, col: 5),
        const BoardPosition(row: 4, col: 3),
        const BoardPosition(row: 4, col: 5),
        const BoardPosition(row: 5, col: 4),
      });

      BoardState bsBlackDstPiece = _generateBoardState({
        Tuple2(p, const BoardPosition(row: 4, col: 4)),
        const Tuple2(Piece.bFu, BoardPosition(row: 3, col: 3)),
        const Tuple2(Piece.wFu, BoardPosition(row: 3, col: 4)),
        const Tuple2(Piece.bFu, BoardPosition(row: 3, col: 5)),
        const Tuple2(Piece.wFu, BoardPosition(row: 4, col: 3)),
        const Tuple2(Piece.bFu, BoardPosition(row: 4, col: 5)),
        const Tuple2(Piece.wFu, BoardPosition(row: 5, col: 4)),
      }, ActiveColor.black);

      expect(ShogiLogicUtil.getMovablePositionSet(bsBlackDstPiece, const BoardPosition(row: 4, col: 4)), {
        const BoardPosition(row: 3, col: 4),
        const BoardPosition(row: 4, col: 3),
        const BoardPosition(row: 5, col: 4),
      });

      BoardState bsBlackOutOfBounds = _generateBoardState({
        Tuple2(p, const BoardPosition(row: 0, col: 8)),
      }, ActiveColor.black);

      expect(ShogiLogicUtil.getMovablePositionSet(bsBlackOutOfBounds, const BoardPosition(row: 0, col: 8)), {
        const BoardPosition(row: 0, col: 7),
        const BoardPosition(row: 1, col: 8),
      });

      BoardState bsBlackOutOfBounds2 = _generateBoardState({
        Tuple2(p, const BoardPosition(row: 8, col: 0)),
      }, ActiveColor.black);

      expect(ShogiLogicUtil.getMovablePositionSet(bsBlackOutOfBounds2, const BoardPosition(row: 8, col: 0)), {
        const BoardPosition(row: 7, col: 0),
        const BoardPosition(row: 7, col: 1),
        const BoardPosition(row: 8, col: 1),
      });
    }
  });

  test('White Ki/To/Ny/Ne/Ng getMovablePositionSet', () {
    for (Piece p in {Piece.wKi, Piece.wTo, Piece.wNy, Piece.wNe, Piece.wNg}) {
      BoardState bsWhiteDstNil =
          _generateBoardState({Tuple2(p, const BoardPosition(row: 4, col: 4))}, ActiveColor.white);

      expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteDstNil, const BoardPosition(row: 4, col: 4)), {
        const BoardPosition(row: 3, col: 4),
        const BoardPosition(row: 4, col: 3),
        const BoardPosition(row: 4, col: 5),
        const BoardPosition(row: 5, col: 3),
        const BoardPosition(row: 5, col: 4),
        const BoardPosition(row: 5, col: 5),
      });

      BoardState bsWhiteDstPiece = _generateBoardState({
        Tuple2(p, const BoardPosition(row: 4, col: 4)),
        const Tuple2(Piece.bFu, BoardPosition(row: 3, col: 4)),
        const Tuple2(Piece.wFu, BoardPosition(row: 4, col: 3)),
        const Tuple2(Piece.bFu, BoardPosition(row: 4, col: 5)),
        const Tuple2(Piece.wFu, BoardPosition(row: 5, col: 3)),
        const Tuple2(Piece.bFu, BoardPosition(row: 5, col: 4)),
        const Tuple2(Piece.wFu, BoardPosition(row: 5, col: 5)),
      }, ActiveColor.white);

      expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteDstPiece, const BoardPosition(row: 4, col: 4)), {
        const BoardPosition(row: 3, col: 4),
        const BoardPosition(row: 4, col: 5),
        const BoardPosition(row: 5, col: 4),
      });

      BoardState bsWhiteOutOfBounds = _generateBoardState({
        Tuple2(p, const BoardPosition(row: 0, col: 8)),
      }, ActiveColor.white);

      expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteOutOfBounds, const BoardPosition(row: 0, col: 8)), {
        const BoardPosition(row: 0, col: 7),
        const BoardPosition(row: 1, col: 7),
        const BoardPosition(row: 1, col: 8),
      });

      BoardState bsWhiteOutOfBounds2 = _generateBoardState({
        Tuple2(p, const BoardPosition(row: 8, col: 0)),
      }, ActiveColor.white);

      expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteOutOfBounds2, const BoardPosition(row: 8, col: 0)), {
        const BoardPosition(row: 7, col: 0),
        const BoardPosition(row: 8, col: 1),
      });
    }
  });
}
