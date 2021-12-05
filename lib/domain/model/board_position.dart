import 'package:equatable/equatable.dart';

class BoardPosition extends Equatable {
  final int _row;
  final int _col;

  const BoardPosition({required int row, required int col})
      : _row = row,
        _col = col;

  int get row => _row;

  int get col => _col;

  @override
  List<Object?> get props => [_row, _col];
}
