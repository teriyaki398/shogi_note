import 'package:shogi_note/application/port/shogi_note_repository.dart';
import 'package:shogi_note/domain/model/block.dart';

import '../shogi_note_service.dart';

class ShogiNoteServiceImpl implements ShogiNoteService {
  final ShogiNoteRepository _repository;

  ShogiNoteServiceImpl(this._repository);

  @override
  Block getBlock() {
    _repository.getBlock();
    // TODO: implement getBlock
    throw UnimplementedError();
  }
}
