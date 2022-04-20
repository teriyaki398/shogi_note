import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiver/iterables.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/const/piece_attributes.dart';
import 'package:shogi_note/domain/const/piece_variant_maps.dart';
import 'package:shogi_note/domain/model/board_position.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/presentation/const/block_mode.dart';
import 'package:shogi_note/presentation/controller/block_controller.dart';
import 'package:tuple/tuple.dart';

class BoardView extends StatelessWidget {
  static const double cellWidth = 40;
  static const double cellHeight = 40;
  static const int rowNum = 9;
  static const int colNum = 9;

  const BoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cellWidth * colNum,
      child: Column(
        children: [
          SizedBox(height: cellHeight, child: _buildHolderView(ActiveColor.white)),
          const SizedBox(height: 10),
          SizedBox(height: cellHeight * rowNum, width: cellWidth * colNum, child: _getBoardView(context)),
          const SizedBox(height: 10),
          SizedBox(height: cellHeight, child: _buildHolderView(ActiveColor.black))
        ],
      ),
    );
  }

  Widget _getBoardView(BuildContext context) {
    return Consumer<BlockController>(builder: (_, blockController, __) {
      BoardState boardState = blockController.currentBoardState;

      return AspectRatio(
          aspectRatio: 1.0,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: rowNum),
            itemBuilder: (context, index) {
              BoardPosition pos = BoardPosition((index / rowNum).floor(), index % colNum);
              Piece piece = boardState.pieceOnBoard[pos.row][pos.col];

              return _buildBoardCellView(piece, pos, context);
            },
            itemCount: rowNum * colNum,
            shrinkWrap: true,
          ));
    });
  }

  Widget _buildBoardCellView(Piece piece, BoardPosition pos, BuildContext context) {
    return Consumer<BlockController>(builder: (_, blockController, __) {
      String pieceDisplayChr = PieceVariantMaps.pieceToDisplayChr(piece) ?? '';
      Color cellColor = blockController.isClickedCell(pos) ? Colors.amberAccent : Colors.white;

      return GestureDetector(
          onTap: () {
            _onTapBoardCell(pos, blockController, context);
          },
          child: Container(
              decoration: BoxDecoration(
                color: cellColor,
                border: Border.all(color: Colors.black45),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10), // TODO: Consider ratio of parent widget size
                  child: RotatedBox(
                    quarterTurns: PieceAttributes.isBlackPiece(piece) ? 0 : 2, // Flip cell for white piece
                    child: FittedBox(fit: BoxFit.fitWidth, child: Text(pieceDisplayChr)),
                  ))));
    });
  }

  Future<void> _onTapBoardCell(BoardPosition pos, BlockController blockController, BuildContext context) async {
    if (blockController.blockMode != BlockMode.edit) {
      return;
    }

    blockController.onClickBoardCell(pos, context);
  }

  Widget _buildHolderView(ActiveColor color) {
    return Consumer<BlockController>(builder: (_, blockController, __) {
      BoardState boardState = blockController.currentBoardState;

      int holderSize = color == ActiveColor.black ? boardState.bHolder.length : boardState.wHolder.length;

      List<Widget> children = [];
      for (var i in range(holderSize)) {
        i as int;
        Tuple2<Piece, int> pieceWithCount = color == ActiveColor.black ? boardState.bHolder[i] : boardState.wHolder[i];
        children.add(_buildHolderCellView(pieceWithCount));

        // Add right side margin
        children.add(Container(width: 10));
      }

      return Row(
        children: children,
      );
    });
  }

  Widget _buildHolderCellView(Tuple2<Piece, int> pieceWithCount) {
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
