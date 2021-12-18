import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/presentation/const/block_mode.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:shogi_note/presentation/controller/note_controller.dart';
import 'package:shogi_note/service/shogi_note_service.dart';

import 'block_view.dart';

class NotePageView extends StatelessWidget {
  const NotePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ShogiNoteService, NoteController>(
      builder: (_, shogiNoteService, noteController, __) {
        return Scaffold(
          body: Center(
              child: SizedBox(
                  width: 950,
                  child: ListView.builder(
                    itemCount: noteController.note.blockList.length,
                    itemBuilder: (context, index) {
                      return _buildBlockView(noteController, index);
                    },
                  ))),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                noteController.onClickBlockAddButton();
              },
              child: const Icon(Icons.add_circle)),
        );
      },
    );
  }

  Widget _buildBlockView(NoteController noteController, int index) {
    BlockController blockController = BlockController(block: noteController.note.blockList[index]);

    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => blockController)],
        child: Column(
          children: [_getBlockInterfaceView(index), Container(height: 20), const BlockView()],
        ));
  }

  Widget _getBlockInterfaceView(int index) {
    return Consumer2<NoteController, BlockController>(builder: (_, noteController, blockController, __) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: () {
          if (blockController.blockMode == BlockMode.read) {
            return List.of([
              ElevatedButton.icon(
                onPressed: () {
                  blockController.onClickEditButton();
                },
                icon: const Icon(Icons.edit),
                label: const Text('edit'),
              )
            ]);
          } else {
            return List.of([
              ElevatedButton.icon(
                onPressed: () {
                  blockController.onClickSaveButton();
                },
                icon: const Icon(Icons.save),
                label: const Text('save'),
              ),
              Container(width: 10),
              ElevatedButton.icon(
                  onPressed: () {
                    noteController.onClickBlockDeleteButton(index);
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text('delete'))
            ]);
          }
        }(),
      );
    });
  }
}
