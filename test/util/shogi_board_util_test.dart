import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/util/shogi_board_util.dart';

Future main() async {
  test('test', () {
    // TODO: Create test case (not debug)
    String sfen1 = 'lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1';
    BoardState state = ShogiBoardUtil.buildBoardState(sfen1);

    print(state.pieceOnBoard);
    print(state.bHolder);
    print(state.wHolder);
    print(state.color);

    String sfen2 = "lns1kg1+Bl/4g4/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4RK3/+r1SG1GSNL b SNPbl2p 1";
    BoardState state2 = ShogiBoardUtil.buildBoardState(sfen2);

    print(state2.pieceOnBoard);
    print(state2.bHolder);
    print(state2.wHolder);
    print(state2.color);
  });
}
