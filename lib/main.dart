import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:shogi_note/presentation/widget/block_view.dart';

import 'domain/model/block.dart';
import 'domain/util/board_state_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Block block = Block(
        blockId: "00d61c53-281c-4e78-9df9-268ac72dc17e",
        boardStateList: [
          BoardStateUtil.buildBoardState("lns1kg1+Bl/4g4/p1pp1p1pp/4p1p2/4n4/2P6/P2P1PPPP/4RK3/+r1SG1GSNL b SNPbl2p 1")
          // "lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1")
        ],
        comment: "test comment");

    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => BlockController(block: block))],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Scaffold(body: Center(child: BlockView()))));
  }
}
