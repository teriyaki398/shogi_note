import 'package:flutter/material.dart';
import 'package:shogi_note/presentation/widget/shogi_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(body: Center(child: ShogiPageView())));
  }
}
