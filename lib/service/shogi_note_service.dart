import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/note.dart';

abstract class ShogiNoteService {
  Note getNote();

  void setNote(Note note);

  Block getBlock();
}
