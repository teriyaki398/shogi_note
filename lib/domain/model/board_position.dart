import 'package:equatable/equatable.dart';

class BoardPosition extends Equatable {
  final int row;
  final int col;

  const BoardPosition({required this.row, required this.col});

  @override
  List<Object?> get props => [row, col];
}
