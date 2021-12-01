import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/application/impl/shogi_note_service_impl.dart';
import 'package:shogi_note/application/port/shogi_note_repository.dart';
import 'package:shogi_note/application/shogi_note_service.dart';
import 'package:shogi_note/presentation/controller/note_controller.dart';
import 'package:shogi_note/presentation/widget/note_view.dart';
import 'package:shogi_note/repository/hive/impl/shogi_note_repository_hive_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShogiNoteRepository shogiNoteRepository = ShogiNoteRepositoryHiveImpl();
    ShogiNoteService shogiNoteService = ShogiNoteServiceImpl(shogiNoteRepository);

    return MultiProvider(
        providers: [
          Provider(create: (context) => shogiNoteService),
          ChangeNotifierProvider(
              create: (context) => NoteController(note: shogiNoteService.getNote(), shogiNoteService: shogiNoteService))
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Scaffold(body: Center(child: NotePageView()))));
  }
}
