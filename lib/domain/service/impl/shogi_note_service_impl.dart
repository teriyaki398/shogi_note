import 'package:shogi_note/domain/model/block.dart';
import 'package:shogi_note/domain/service/port/shogi_note_repository.dart';
import 'package:shogi_note/domain/service/shogi_note_service.dart';

class ShogiNoteServiceImpl implements ShogiNoteService {
  final ShogiNoteRepository _repository;

  ShogiNoteServiceImpl(this._repository);

  @override
  Block getBlock() {
    // TODO: implement getBlock
    throw UnimplementedError();
  }
}
