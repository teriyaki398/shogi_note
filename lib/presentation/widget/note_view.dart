import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                      BlockController blockController = BlockController(block: noteController.note.blockList[index]);

                      return MultiProvider(
                          providers: [ChangeNotifierProvider(create: (context) => blockController)],
                          child: Row(
                            children: [
                              const BlockView(),
                              Container(width: 40),
                              Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        noteController.onClickBlockDeleteButton(index);
                                      },
                                      child: const Text('delete')),
                                  Container(height: 20),
                                  ElevatedButton(
                                      onPressed: () {
                                        noteController.onClickBlockSaveButton(blockController.block, index);
                                      },
                                      child: const Text('save'))
                                ],
                              ),
                            ],
                          ));
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
}
