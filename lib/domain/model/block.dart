class Block {
  final String blockId;

  Block({required this.blockId});

  @override
  operator ==(other) => other is Block && other.blockId == blockId;

  @override
  int get hashCode => blockId.hashCode;

  @override
  String toString() {
    return "Block(blockId:$blockId)";
  }
}
