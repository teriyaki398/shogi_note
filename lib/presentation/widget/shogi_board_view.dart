import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/const/piece_variant_maps.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/util/piece_util.dart';
import 'package:tuple/tuple.dart';

class ShogiBoardView extends StatelessWidget {
  static const double cellWidth = 40;
  static const double cellHeight = 40;
  static const int rowNum = 9;
  static const int colNum = 9;

  final BoardState boardState;

  const ShogiBoardView({Key? key, required this.boardState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cellWidth * colNum,
      child: Column(
        children: [
          SizedBox(height: cellHeight, child: _getHolderView(ActiveColor.white)),
          const SizedBox(height: 10),
          SizedBox(height: cellHeight * rowNum, width: cellWidth * colNum, child: _getBoardCellView()),
          const SizedBox(height: 10),
          SizedBox(height: cellHeight, child: _getHolderView(ActiveColor.black))
        ],
      ),
    );
  }

  Widget _getBoardCellView() {
    return AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: rowNum),
          itemBuilder: (context, index) {
            int row = (index / rowNum).floor();
            int col = index % colNum;

            Piece piece = boardState.pieceOnBoard[row][col];
            String pieceDisplayChr = PieceVariantMaps.pieceToDisplayChr(piece) ?? '';

            return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10), // TODO: Consider ratio of parent widget size
                    child: RotatedBox(
                      quarterTurns: PieceUtil.isBlackPiece(piece) ? 0 : 2, // Flip cell for white piece
                      child: FittedBox(fit: BoxFit.fitWidth, child: Text(pieceDisplayChr)),
                    )));
          },
          itemCount: rowNum * colNum,
          shrinkWrap: true,
        ));
  }

  Widget _getHolderView(ActiveColor color) {
    int holderSize = color == ActiveColor.black ? boardState.bHolder.length : boardState.wHolder.length;

    List<Widget> children = [];
    for (var i in range(holderSize)) {
      i as int;
      Tuple2<Piece, int> pieceWithCount = color == ActiveColor.black ? boardState.bHolder[i] : boardState.wHolder[i];
      children.add(_getHolderCellView(pieceWithCount));

      // Add right side margin
      children.add(Container(width: 10));
    }

    return Row(
      children: children,
    );
  }

  Widget _getHolderCellView(Tuple2<Piece, int> pieceWithCount) {
    String pieceDisplayChr = PieceVariantMaps.pieceToDisplayChr(pieceWithCount.item1) ?? '';
    String countChr = pieceWithCount.item2 > 1 ? pieceWithCount.item2.toString() : '';

    return Container(
        height: cellHeight,
        alignment: Alignment.center,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              pieceDisplayChr + countChr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: cellHeight * 0.5),
            )));
  }
}
