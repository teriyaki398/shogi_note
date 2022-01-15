import 'package:equatable/equatable.dart';

class BoardPosition extends Equatable {
  final int _row;
  final int _col;

  BoardPosition(this._row, this._col) {
    if (!isValidPosition(row: _row, col: _col)) {
      throw ArgumentError("Value of row or col is out of bounds: row=$row, col=$col");
    }
  }

  static bool isValidPosition({required int row, required int col}) {
    return row >= 0 && row <= 8 && col >= 0 && col <= 8;
  }

  int get row => _row;

  int get col => _col;

  @override
  List<Object?> get props => [_row, _col];
}
