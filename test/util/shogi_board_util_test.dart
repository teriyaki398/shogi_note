import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/repository/util/sfen_string_util.dart';
import 'package:tuple/tuple.dart';

Future main() async {
  test('test', () {
    String sfen1 = 'lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1';
    BoardState state = SfenStringUtil.buildBoardState(sfen1);

    BoardState expected = const BoardState(pieceOnBoard: [
      [Piece.wKy, Piece.wKe, Piece.wGi, Piece.wKi, Piece.wOu, Piece.wKi, Piece.wGi, Piece.wKe, Piece.wKy],
      [Piece.nil, Piece.wHi, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKa, Piece.nil],
      [Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu, Piece.wFu],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu],
      [Piece.nil, Piece.bKa, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bHi, Piece.nil],
      [Piece.bKy, Piece.bKe, Piece.bGi, Piece.bKi, Piece.bOu, Piece.bKi, Piece.bGi, Piece.bKe, Piece.bKy]
    ], bHolder: [], wHolder: [], color: ActiveColor.black);

    expect(state, expected);

    String sfen2 = "lns1kg1+Bl/4g4/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4RK3/+r1SG1GSNL b SNPbl2p 1";
    BoardState state2 = SfenStringUtil.buildBoardState(sfen2);

    BoardState expected2 = const BoardState(pieceOnBoard: [
      [Piece.wKy, Piece.wKe, Piece.wGi, Piece.nil, Piece.wOu, Piece.wKi, Piece.nil, Piece.bUm, Piece.wKy],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKi, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.wFu, Piece.nil, Piece.wFu, Piece.wFu, Piece.nil, Piece.wFu, Piece.nil, Piece.wFu, Piece.wFu],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wFu, Piece.nil, Piece.wFu, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.wKe, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.nil, Piece.nil, Piece.bFu, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.nil],
      [Piece.bFu, Piece.nil, Piece.nil, Piece.bFu, Piece.nil, Piece.bFu, Piece.bFu, Piece.bFu, Piece.bFu],
      [Piece.nil, Piece.nil, Piece.nil, Piece.nil, Piece.bHi, Piece.bOu, Piece.nil, Piece.nil, Piece.nil],
      [Piece.wRy, Piece.nil, Piece.bGi, Piece.bKi, Piece.nil, Piece.bKi, Piece.bGi, Piece.bKe, Piece.bKy]
    ], bHolder: [
      Tuple2(Piece.bGi, 1),
      Tuple2(Piece.bKe, 1),
      Tuple2(Piece.bFu, 1)
    ], wHolder: [
      Tuple2(Piece.wKa, 1),
      Tuple2(Piece.wKy, 1),
      Tuple2(Piece.wFu, 2)
    ], color: ActiveColor.black);

    expect(state2, expected2);
  });
}
