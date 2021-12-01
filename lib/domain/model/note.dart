import 'package:equatable/equatable.dart';
import 'package:shogi_note/domain/model/block.dart';

class Note extends Equatable {
  final String pageId;
  final List<Block> blockList;

  const Note({required this.pageId, required this.blockList});

  @override
  List<Object?> get props => [pageId, blockList];
}
