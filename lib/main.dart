import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:shogi_note/presentation/widget/block_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => BlockController())],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Scaffold(body: Center(child: BlockView()))));
  }
}
