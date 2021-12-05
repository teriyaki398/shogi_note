import 'package:quiver/iterables.dart';
import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/const/piece_variant_maps.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/domain/util/piece_util.dart';
import 'package:shogi_note/util/string_util.dart';
import 'package:tuple/tuple.dart';

class SfenStringUtil {
  SfenStringUtil._();

  static const String sfenSeparator = ' ';
  static const String sfenSubSeparator = '/';
  static const String sfenBlackChr = 'b';
  static const String sfenWhiteChr = 'w';
  static const String sfenEmptyHolder = '-';
  static const String sfenPromotePrefix = '+';

  /*
  sfen smaple: lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1
   */
  static BoardState buildBoardState(String sfen) {
    // TODO: Validate sfenString
    List<String> sfenSnippets = sfen.split(sfenSeparator);

    String sfenPieceOnBoard = sfenSnippets[0];
    String sfenActiveColor = sfenSnippets[1];
    String sfenPieceHolder = sfenSnippets[2];

    Tuple2<List<Tuple2<Piece, int>>, List<Tuple2<Piece, int>>> holder = _buildPieceHolder(sfenPieceHolder);
    return BoardState(
        pieceOnBoard: sfenPieceOnBoard.split(sfenSubSeparator).map((e) => _buildBoardRow(e)).toList(),
        bHolder: holder.item1,
        wHolder: holder.item2,
        color: sfenActiveColor == sfenBlackChr ? ActiveColor.black : ActiveColor.white);
  }

  /*
  Consider the structure of board part of sfen like this
  {boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}

  sfenBoardRow: {boardRow} string
   */
  static List<Piece> _buildBoardRow(String sfenBoardRow) {
    // TODO: Validate sfenFragment
    List<Piece> pieceList = [];

    for (num i in range(sfenBoardRow.length)) {
      i as int;
      // 1~9 -> The number of consecutive empty cell
      if (StringUtil.isDigit(sfenBoardRow[i])) {
        int? count = int.tryParse(sfenBoardRow[i]);
        pieceList.addAll(List.generate(count!, (index) => Piece.nil));
        continue;
      }

      // + -> promoted piece. consume two characters for one piece
      if (sfenBoardRow[i] == sfenPromotePrefix) {
        continue;
      }
      if (i > 0 && sfenBoardRow[i - 1] == sfenPromotePrefix) {
        pieceList.add(PieceVariantMaps.sfenChrToPiece(sfenBoardRow[i - 1] + sfenBoardRow[i]));
        continue;
      }

      // other -> normal piece. consume one character for one piece
      pieceList.add(PieceVariantMaps.sfenChrToPiece(sfenBoardRow[i]));
    }
    return pieceList;
  }

  /*
  Consider the structure of sfen like this
  {board part} {action color} {piece holder} {move count}

  sfenHolder: {piece holder} string
   */
  static Tuple2<List<Tuple2<Piece, int>>, List<Tuple2<Piece, int>>> _buildPieceHolder(String sfenHolder) {
    if (sfenHolder == sfenEmptyHolder) {
      return Tuple2(List.empty(), List.empty());
    }

    List<Tuple2<Piece, int>> bPieceList = [];
    List<Tuple2<Piece, int>> wPieceList = [];

    for (num i in range(sfenHolder.length)) {
      i as int;

      // 2~9 -> Indicate that next character is duplicated
      if (StringUtil.isDigit(sfenHolder[i])) {
        continue;
      }

      // previous character is 2~9 -> Consider duplication
      if (i > 0 && StringUtil.isDigit(sfenHolder[i - 1])) {
        int count = int.tryParse(sfenHolder[i - 1])!;
        Piece p = PieceVariantMaps.sfenChrToPiece(sfenHolder[i]);
        PieceUtil.isBlackPiece(p) ? bPieceList.add(Tuple2(p, count)) : wPieceList.add(Tuple2(p, count));
        continue;
      }

      // other -> normal case
      Piece p = PieceVariantMaps.sfenChrToPiece(sfenHolder[i]);
      PieceUtil.isBlackPiece(p) ? bPieceList.add(Tuple2(p, 1)) : wPieceList.add(Tuple2(p, 1));
    }
    return Tuple2<List<Tuple2<Piece, int>>, List<Tuple2<Piece, int>>>(bPieceList, wPieceList);
  }
}
