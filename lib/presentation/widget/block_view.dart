import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/presentation/const/block_mode.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:shogi_note/presentation/widget/board_view.dart';

class BlockView extends StatelessWidget {
  const BlockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BlockController>(builder: (_, blockController, __) {
      return Column(
        children: [
          Row(
            children: [
              Container(width: 20),
              Column(children: () {
                List<Widget> boardColumn = List.of([const BoardView()]);

                if (blockController.blockMode == BlockMode.read) {
                  boardColumn.add(_getBoardInterfaceView(blockController));
                }

                return boardColumn;
              }()),
              Container(width: 40),
              SizedBox(
                width: 400,
                child: Column(children: [
                  // TODO: Implement sequence view
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                      ),
                      height: 100,
                      width: 400,
                      child: const Text('TBD')),
                  Container(height: 20),
                  _getCommentView(blockController.block.comment, blockController.blockMode)
                ]),
              )
            ],
          )
        ],
      );
    });
  }

  Widget _getBoardInterfaceView(BlockController blockController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              blockController.onClickFirstButton();
            },
            child: const Text('first')),
        Container(width: 20),
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
        Container(width: 20),
        ElevatedButton(
            onPressed: () {
              blockController.onClickLastButton();
            },
            child: const Text('last')),
      ],
    );
  }

  Widget _getCommentView(String comment, BlockMode blockMode) {
    return Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
        ),
        child: TextFormField(
          initialValue: comment,
          readOnly: blockMode == BlockMode.read,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          autofocus: true,
        ));
  }
}
