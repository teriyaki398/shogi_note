import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/util/board_state_util.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:shogi_note/presentation/widget/block_view.dart';

class ShogiPageView extends StatelessWidget {
  const ShogiPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Block block = Block(
        blockId: "00d61c53-281c-4e78-9df9-268ac72dc17e",
        boardStateList: [
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/ppppppppp/9/9/4P4/PPPP1PPPP/1B5R1/LNSGKGSNL b - 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/pppppp1pp/6p2/9/4P4/PPPP1PPPP/1B5R1/LNSGKGSNL b - 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/pppppp1pp/6p2/9/2P1P4/PP1P1PPPP/1B5R1/LNSGKGSNL b - 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/1p4p2/9/2P1P4/PP1P1PPPP/1B5R1/LNSGKGSNL b - 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/1p4p2/4P4/2P6/PP1P1PPPP/1B5R1/LNSGKGSNL b - 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/6p2/1p2P4/2P6/PP1P1PPPP/1B5R1/LNSGKGSNL b - 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/6p2/1p2P4/2P6/PP1P1PPPP/1B2R4/LNSGKGSNL b - 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/6p2/4P4/1pP6/PP1P1PPPP/1B2R4/LNSGKGSNL b - 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/1r5b1/p1pppp1pp/6p2/4P4/1PP6/P2P1PPPP/1B2R4/LNSGKGSNL b P 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/7b1/p1pppp1pp/6p2/4P4/1rP6/P2P1PPPP/1B2R4/LNSGKGSNL b Pp 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/7b1/p1pppp1pp/4P1p2/9/1rP6/P2P1PPPP/1B2R4/LNSGKGSNL b Pp 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/7b1/p1pp1p1pp/4p1p2/9/1rP6/P2P1PPPP/1B2R4/LNSGKGSNL b P2p 1"),
          BoardStateUtil.buildBoardState("lnsgkgsnl/7+B1/p1pp1p1pp/4p1p2/9/1rP6/P2P1PPPP/4R4/LNSGKGSNL b BP2p 1"),
          BoardStateUtil.buildBoardState("lnsgkg1nl/7s1/p1pp1p1pp/4p1p2/9/1rP6/P2P1PPPP/4R4/LNSGKGSNL b BPb2p 1"),
          BoardStateUtil.buildBoardState("lnsgkg1nl/7s1/p1pp1p1pp/4p1p2/9/1rP6/P1BP1PPPP/4R4/LNSGKGSNL b Pb2p 1"),
          BoardStateUtil.buildBoardState("lnsgkg1nl/7s1/p1pp1p1pp/4p1p2/9/2P6/P1BP1PPPP/4R4/L+rSGKGSNL b Pbn2p 1"),
          BoardStateUtil.buildBoardState("lnsgkg1nl/7+B1/p1pp1p1pp/4p1p2/9/2P6/P2P1PPPP/4R4/L+rSGKGSNL b SPbn2p 1"),
          BoardStateUtil.buildBoardState("lnsgkg1nl/7+B1/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4R4/L+rSGKGSNL b SPb2p 1"),
          BoardStateUtil.buildBoardState("lnsgkg1nl/7+B1/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4RK3/L+rSG1GSNL b SPb2p 1"),
          BoardStateUtil.buildBoardState("lnsgkg1nl/7+B1/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4RK3/+r1SG1GSNL b SPbl2p 1"),
          BoardStateUtil.buildBoardState("lnsgkg1+Bl/9/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4RK3/+r1SG1GSNL b SNPbl2p 1"),
          BoardStateUtil.buildBoardState("lnsgkg1+Bl/9/p1pp1p1pp/4plp2/4n4/2P6/P2P1PPPP/4RK3/+r1SG1GSNL b SNPb2p 1"),
        ],
        comment: "test comment");

    List<Block> blockList = [block, block, block, block];

    return SizedBox(
        width: 1000,
        child: ListView.builder(
          itemCount: blockList.length,
          itemBuilder: (context, index) {
            return MultiProvider(
                providers: [ChangeNotifierProvider(create: (context) => BlockController(block: blockList[index]))],
                child: const BlockView());
          },
        ));
  }
}