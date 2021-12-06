import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/repository/util/sfen_string_util.dart';

Future main() async {
  test('equality test', () {
    Block src = Block(
        blockId: "cf84afbe-9b06-495e-9887-9bf7e6114406",
        boardStateList: [
          SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1")
        ],
        comment: "test comment");
    Block src2 = Block(
        blockId: "894f1344-7af5-4694-8f97-c705b9318803",
        boardStateList: [
          SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1")
        ],
        comment: "test comment");
    Block src3 = Block(
        blockId: "cf84afbe-9b06-495e-9887-9bf7e6114406",
        boardStateList: [
          SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1")
        ],
        comment: "test comment");

    expect(src == src2, isFalse);
    expect(src == src3, isTrue);
  });
}
