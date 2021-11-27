import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:shogi_note/presentation/widget/shogi_board_view.dart';

class BlockView extends StatelessWidget {
  const BlockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BlockController>(builder: (_, blockController, __) {
      return ShogiBoardView(boardState: blockController.boardState);
    });
  }
}
