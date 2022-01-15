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
      BoardState bsBlackDstNil = _generateBoardState({Tuple2(p, BoardPosition(4, 4))}, ActiveColor.black);

      expect(ShogiLogicUtil.getMovablePositionSet(bsBlackDstNil, BoardPosition(4, 4)), {
        BoardPosition(3, 3),
        BoardPosition(3, 4),
        BoardPosition(3, 5),
        BoardPosition(4, 3),
        BoardPosition(4, 5),
        BoardPosition(5, 4),
      });

      BoardState bsBlackDstPiece = _generateBoardState({
        Tuple2(p, BoardPosition(4, 4)),
        Tuple2(Piece.bFu, BoardPosition(3, 3)),
        Tuple2(Piece.wFu, BoardPosition(3, 4)),
        Tuple2(Piece.bFu, BoardPosition(3, 5)),
        Tuple2(Piece.wFu, BoardPosition(4, 3)),
        Tuple2(Piece.bFu, BoardPosition(4, 5)),
        Tuple2(Piece.wFu, BoardPosition(5, 4)),
      }, ActiveColor.black);

      expect(ShogiLogicUtil.getMovablePositionSet(bsBlackDstPiece, BoardPosition(4, 4)), {
        BoardPosition(3, 4),
        BoardPosition(4, 3),
        BoardPosition(5, 4),
      });

      BoardState bsBlackOutOfBounds = _generateBoardState({
        Tuple2(p, BoardPosition(0, 8)),
      }, ActiveColor.black);

      expect(ShogiLogicUtil.getMovablePositionSet(bsBlackOutOfBounds, BoardPosition(0, 8)), {
        BoardPosition(0, 7),
        BoardPosition(1, 8),
      });

      BoardState bsBlackOutOfBounds2 = _generateBoardState({
        Tuple2(p, BoardPosition(8, 0)),
      }, ActiveColor.black);

      expect(ShogiLogicUtil.getMovablePositionSet(bsBlackOutOfBounds2, BoardPosition(8, 0)), {
        BoardPosition(7, 0),
        BoardPosition(7, 1),
        BoardPosition(8, 1),
      });
    }
  });

  test('White Ki/To/Ny/Ne/Ng getMovablePositionSet', () {
    for (Piece p in {Piece.wKi, Piece.wTo, Piece.wNy, Piece.wNe, Piece.wNg}) {
      BoardState bsWhiteDstNil = _generateBoardState({Tuple2(p, BoardPosition(4, 4))}, ActiveColor.white);

      expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteDstNil, BoardPosition(4, 4)), {
        BoardPosition(3, 4),
        BoardPosition(4, 3),
        BoardPosition(4, 5),
        BoardPosition(5, 3),
        BoardPosition(5, 4),
        BoardPosition(5, 5),
      });

      BoardState bsWhiteDstPiece = _generateBoardState({
        Tuple2(p, BoardPosition(4, 4)),
        Tuple2(Piece.bFu, BoardPosition(3, 4)),
        Tuple2(Piece.wFu, BoardPosition(4, 3)),
        Tuple2(Piece.bFu, BoardPosition(4, 5)),
        Tuple2(Piece.wFu, BoardPosition(5, 3)),
        Tuple2(Piece.bFu, BoardPosition(5, 4)),
        Tuple2(Piece.wFu, BoardPosition(5, 5)),
      }, ActiveColor.white);

      expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteDstPiece, BoardPosition(4, 4)), {
        BoardPosition(3, 4),
        BoardPosition(4, 5),
        BoardPosition(5, 4),
      });

      BoardState bsWhiteOutOfBounds = _generateBoardState({
        Tuple2(p, BoardPosition(0, 8)),
      }, ActiveColor.white);

      expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteOutOfBounds, BoardPosition(0, 8)), {
        BoardPosition(0, 7),
        BoardPosition(1, 7),
        BoardPosition(1, 8),
      });

      BoardState bsWhiteOutOfBounds2 = _generateBoardState({
        Tuple2(p, BoardPosition(8, 0)),
      }, ActiveColor.white);

      expect(ShogiLogicUtil.getMovablePositionSet(bsWhiteOutOfBounds2, BoardPosition(8, 0)), {
        BoardPosition(7, 0),
        BoardPosition(8, 1),
      });
    }
  });
}
