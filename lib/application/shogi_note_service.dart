import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/model/note.dart';

abstract class ShogiNoteService {
  Note getNote();

  Block getBlock();
}
