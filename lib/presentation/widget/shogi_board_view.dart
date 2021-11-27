import 'package:flutter/material.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/const/piece_variant_maps.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/util/piece_util.dart';

class ShogiBoardView extends StatelessWidget {
  static const int rowNum = 9;
  static const int colNum = 9;

  final BoardState boardState;

  const ShogiBoardView({Key? key, required this.boardState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Stack(
      children: [
        const AspectRatio(aspectRatio: 1.0),
        AspectRatio(
            aspectRatio: 1.0,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: rowNum),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                  child: _getPieceCellView(index),
                );
              },
              itemCount: rowNum * colNum,
              shrinkWrap: true,
            ))
      ],
    ));
  }

  Widget _getPieceCellView(int index) {
    int row = (index / rowNum).floor();
    int col = index % colNum;

    Piece piece = boardState.pieceOnBoard[row][col];

    return Padding(
        padding: const EdgeInsets.all(10), // TODO: Consider ratio of parent widget size
        child: RotatedBox(
          quarterTurns: PieceUtil.isBlackPiece(piece) ? 0 : 2, // Flip cell for white piece
          child: FittedBox(fit: BoxFit.fitWidth, child: Text(_getPieceDisplayChr(boardState.pieceOnBoard[row][col]))),
        ));
  }

  String _getPieceDisplayChr(Piece piece) {
    return PieceVariantMaps.pieceToDisplayChr(piece) ?? '';
  }
}
