import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/application/shogi_note_service.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:shogi_note/presentation/controller/note_controller.dart';

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
                  width: 850,
                  child: ListView.builder(
                    itemCount: noteController.note.blockList.length,
                    itemBuilder: (context, index) {
                      return MultiProvider(providers: [
                        ChangeNotifierProvider(
                            create: (context) => BlockController(block: noteController.note.blockList[index]))
                      ], child: const BlockView());
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
