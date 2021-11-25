import 'package:flutter/foundation.dart';
import 'package:shogi_note/domain/model/block.dart';

class BlockController with ChangeNotifier {
  final Block block;

  BlockController({required this.block});

  String get sfen => block.sfenList[0];
}
