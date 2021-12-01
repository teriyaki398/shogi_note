import 'package:flutter/material.dart';
import 'package:shogi_note/application/shogi_note_service.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/model/note.dart';
import 'package:uuid/uuid.dart';

class NoteController with ChangeNotifier {
  Note _note;
  final ShogiNoteService _shogiNoteService;

  NoteController({required Note note, required ShogiNoteService shogiNoteService})
      : _note = note,
        _shogiNoteService = shogiNoteService;

  Note get note => _note;

  // Create new block when add button is clicked
  void onClickBlockAddButton() {
    // Generate initial block
    Block lastBlock = _note.blockList[_note.blockList.length - 1];
    BoardState lastBoardState = lastBlock.boardStateList[lastBlock.boardStateList.length - 1];
    Block newBlock = Block(
        blockId: const Uuid().toString(), boardStateList: [lastBoardState], comment: "", nextBlockIdList: List.empty());

    List<Block> blockList = List.of(_note.blockList + [newBlock]);
    Note newNote = Note(pageId: _note.pageId, blockList: blockList);

    _note = newNote;
    notifyListeners();
  }
}
