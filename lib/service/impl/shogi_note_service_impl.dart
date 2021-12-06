import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/note.dart';
import 'package:shogi_note/repository/util/sfen_string_util.dart';
import 'package:shogi_note/service/port/shogi_note_repository.dart';

import '../shogi_note_service.dart';

class ShogiNoteServiceImpl implements ShogiNoteService {
  // TODO: Remove after
  Note note = Note(pageId: "784a440d-cf7b-43f1-b4bf-4bf0efed26b7", blockList: [
    Block(
        blockId: "00d61c53-281c-4e78-9df9-268ac72dc17e",
        boardStateList: [
          SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1")
        ],
        comment: "")
  ]);

  // Block block = Block(
  //     blockId: "00d61c53-281c-4e78-9df9-268ac72dc17e",
  //     boardStateList: [
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/ppppppppp/9/9/4P4/PPPP1PPPP/1B5R1/LNSGKGSNL b - 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/pppppp1pp/6p2/9/4P4/PPPP1PPPP/1B5R1/LNSGKGSNL b - 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/pppppp1pp/6p2/9/2P1P4/PP1P1PPPP/1B5R1/LNSGKGSNL b - 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/1p4p2/9/2P1P4/PP1P1PPPP/1B5R1/LNSGKGSNL b - 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/1p4p2/4P4/2P6/PP1P1PPPP/1B5R1/LNSGKGSNL b - 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/6p2/1p2P4/2P6/PP1P1PPPP/1B5R1/LNSGKGSNL b - 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/6p2/1p2P4/2P6/PP1P1PPPP/1B2R4/LNSGKGSNL b - 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/6p2/4P4/1pP6/PP1P1PPPP/1B2R4/LNSGKGSNL b - 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/6p2/4P4/1PP6/P2P1PPPP/1B2R4/LNSGKGSNL b P 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/7b1/p1pppp1pp/6p2/4P4/1rP6/P2P1PPPP/1B2R4/LNSGKGSNL b Pp 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/7b1/p1pppp1pp/4P1p2/9/1rP6/P2P1PPPP/1B2R4/LNSGKGSNL b Pp 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/7b1/p1pp1p1pp/4p1p2/9/1rP6/P2P1PPPP/1B2R4/LNSGKGSNL b P2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkgsnl/7+B1/p1pp1p1pp/4p1p2/9/1rP6/P2P1PPPP/4R4/LNSGKGSNL b BP2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkg1nl/7s1/p1pp1p1pp/4p1p2/9/1rP6/P2P1PPPP/4R4/LNSGKGSNL b BPb2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkg1nl/7s1/p1pp1p1pp/4p1p2/9/1rP6/P1BP1PPPP/4R4/LNSGKGSNL b Pb2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkg1nl/7s1/p1pp1p1pp/4p1p2/9/2P6/P1BP1PPPP/4R4/L+rSGKGSNL b Pbn2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkg1nl/7+B1/p1pp1p1pp/4p1p2/9/2P6/P2P1PPPP/4R4/L+rSGKGSNL b SPbn2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkg1nl/7+B1/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4R4/L+rSGKGSNL b SPb2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkg1nl/7+B1/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4RK3/L+rSG1GSNL b SPb2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkg1nl/7+B1/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4RK3/+r1SG1GSNL b SPbl2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkg1+Bl/9/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4RK3/+r1SG1GSNL b SNPbl2p 1"),
  //       SfenStringUtil.buildBoardState("lnsgkg1+Bl/9/p1pp1p1pp/4plp2/4n4/2P6/P2P1PPPP/4RK3/+r1SG1GSNL b SNPb2p 1"),
  //     ],
  //     comment: "test comment");

  final ShogiNoteRepository _repository;

  ShogiNoteServiceImpl(this._repository);

  @override
  Note getNote() {
    return note;
  }

  void setNote(Note note) {
    this.note = note;
  }

  @override
  Block getBlock() {
    _repository.getBlock();
    // TODO: implement getBlock
    throw UnimplementedError();
  }
}
