import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:shogi_note/presentation/widget/shogi_board_view.dart';

class BlockView extends StatelessWidget {
  const BlockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BlockController>(builder: (_, blockController, __) {
      return Container(
          // // TODO: debug remove this later
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
          ),
          child: Column(children: [
            ShogiBoardView(boardState: blockController.boardState),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      blockController.onClickBackButton();
                    },
                    child: const Text('back')),
                Container(width: 20),
                ElevatedButton(
                    onPressed: () {
                      blockController.onClickNextButton();
                    },
                    child: const Text('next')),
              ],
            )
          ]));
    });
  }
}
