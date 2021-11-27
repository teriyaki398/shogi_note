import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/const/piece_variety_maps.dart';
import 'package:shogi_note/domain/model/board_state.dart';
import 'package:shogi_note/util/piece_util.dart';
import 'package:shogi_note/util/string_util.dart';
import 'package:tuple/tuple.dart';

class ShogiBoardUtil {
  static const String sfenSeparator = ' ';
  static const String sfenSubSeparator = '/';
  static const String sfenBlackChr = 'b';
  static const String sfenWhiteChr = 'w';
  static const String sfenEmptyHolder = '-';
  static const String sfenPromotePrefix = '+';

  ShogiBoardUtil._();

  /*
  sfen smaple: lnsgkgsnl/1r5b1/ppppppppp/9/9/9/PPPPPPPPP/1B5R1/LNSGKGSNL b - 1
   */
  static BoardState buildBoardState(String sfen) {
    // TODO: Validate sfenString
    List<String> sfenSnippets = sfen.split(sfenSeparator);

    String sfenPieceOnBoard = sfenSnippets[0];
    String sfenActiveColor = sfenSnippets[1];
    String sfenPieceHolder = sfenSnippets[2];

    ActiveColor activeColor = ActiveColor.black;
    if (sfenActiveColor == 'b') {
      activeColor = ActiveColor.black;
    } else if (sfenActiveColor == 'w') {
      activeColor = ActiveColor.white;
    } else {
      throw Exception(); // TODO: Throw appropriate exception
    }

    Tuple2<List<Piece>, List<Piece>> holder = _buildPieceHolder(sfenPieceHolder);

    return BoardState(
        pieceOnBoard:
            sfenPieceOnBoard.split(sfenSubSeparator).map((e) => _buildBoardRow(e)).toList(),
        bHolder: holder.item1,
        wHolder: holder.item2,
        color: activeColor);
  }

  /*
  Consider the structure of board part of sfen like this
  {boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}/{boardRow}

  sfenBoardRow: {boardRow} string
   */
  static List<Piece> _buildBoardRow(String sfenBoardRow) {
    // TODO: Validate sfenFragment
    List<Piece> pieceList = [];

    for (int index = 0; index < sfenBoardRow.length; index++) {
      // 1~9 -> The number of consecutive empty cell
      if (StringUtil.isDigit(sfenBoardRow[index])) {
        int? count = int.tryParse(sfenBoardRow[index]);
        pieceList.addAll(List.generate(count!, (index) => Piece.none));
        continue;
      }

      // + -> promoted piece. consume two characters for one piece
      if (sfenBoardRow[index] == sfenPromotePrefix) {
        continue;
      }
      if (index > 1 && sfenBoardRow[index - 1] == sfenPromotePrefix) {
        pieceList.add(
            PieceVarietyMaps.getPieceFromSfenChr(sfenBoardRow[index - 1] + sfenBoardRow[index]));
        continue;
      }

      // other -> normal piece. consume one character for one piece
      pieceList.add(PieceVarietyMaps.getPieceFromSfenChr(sfenBoardRow[index]));
    }
    return pieceList;
  }

  /*
  Consider the structure of sfen like this
  {board part} {action color} {piece holder} {move count}

  sfenHolder: {piece holder} string
   */
  static Tuple2<List<Piece>, List<Piece>> _buildPieceHolder(String sfenHolder) {
    if (sfenHolder == sfenEmptyHolder) {
      return Tuple2(List.empty(), List.empty());
    }

    List<Piece> allPieceList = [];

    for (int index = 0; index < sfenHolder.length; index++) {
      // 2~9 -> Indicate that next character is duplicated
      // if number is 5, add 4 pieces to list referring next character
      if (StringUtil.isDigit(sfenHolder[index])) {
        int? count = int.tryParse(sfenHolder[index]);
        allPieceList.addAll(List.generate(
            count! - 1, (index) => PieceVarietyMaps.getPieceFromSfenChr(sfenHolder[index + 1])));
      } else {
        allPieceList.add(PieceVarietyMaps.getPieceFromSfenChr(sfenHolder[index]));
      }
    }

    List<Piece> bPieceList = [];
    List<Piece> wPieceList = [];

    for (Piece piece in allPieceList) {
      if (PieceUtil.isBlackPiece(piece)) {
        wPieceList.add(piece);
      } else if (PieceUtil.isWhitePiece(piece)) {
        bPieceList.add(piece);
      }
    }
    return Tuple2<List<Piece>, List<Piece>>(bPieceList, wPieceList);
  }
}
