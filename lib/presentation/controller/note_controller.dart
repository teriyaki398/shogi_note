import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/model/note.dart';
import 'package:shogi_note/service/shogi_note_service.dart';
import 'package:uuid/uuid.dart';

class NoteController with ChangeNotifier {
  late Note _note;
  final ShogiNoteService _shogiNoteService;

  NoteController({required ShogiNoteService shogiNoteService}) : _shogiNoteService = shogiNoteService {
    _note = _shogiNoteService.getNote();
  }

  Note get note => _note;

  // Create new block when add button is clicked
  // Initial board state of newly created block is the last board state of previous block
  void onClickBlockAddButton() {
    Block lastBlock = _note.lastBlock;
    BoardState lastBoardState = lastBlock.lastBoardState;
    Block newBlock = Block(
        blockId: const Uuid().toString(), boardStateList: [lastBoardState], comment: "", nextBlockIdList: List.empty());

    List<Block> blockList = List.of(_note.blockList + [newBlock]);
    Note newNote = Note(pageId: _note.pageId, blockList: blockList);

    _note = newNote;
    notifyListeners();
  }

  // Delete last block when delete button is clicked
  void onClickBlockDeleteButton(int index) {
    if (index == 0 || index < _note.blockList.length - 1) {
      return;
    }
    List<Block> currentBlockList = _note.blockList;
    List<Block> blockListWithDropLast =
        range(currentBlockList.length - 1).map((i) => currentBlockList[i as int]).toList();
    _note = Note(pageId: _note.pageId, blockList: blockListWithDropLast);
    notifyListeners();
  }
}
