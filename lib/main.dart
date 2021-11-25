import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:shogi_note/presentation/widget/block_view.dart';

import 'domain/model/block.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Block block = Block(
        blockId: "00d61c53-281c-4e78-9df9-268ac72dc17e",
        sfenList: ["lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL"],
        comment: "test comment");

    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => BlockController(block: block))],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Scaffold(body: Center(child: BlockView()))));
  }
}
