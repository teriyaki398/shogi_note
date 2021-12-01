import 'package:flutter/material.dart';
import 'package:shogi_note/application/shogi_note_service.dart';
import 'package:shogi_note/domain/model/note.dart';

class NoteController with ChangeNotifier {
  final Note _note;
  final ShogiNoteService _shogiNoteService;

  NoteController({required Note note, required ShogiNoteService shogiNoteService})
      : _note = note,
        _shogiNoteService = shogiNoteService;

  Note get note => _note;
}
