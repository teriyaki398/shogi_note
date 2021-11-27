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

    Tuple2<List<Piece>, List<Piece>> holder = buildPieceHolder(sfenPieceHolder);

    return BoardState(
        pieceOnBoard:
            sfenPieceOnBoard.split(sfenSubSeparator).map((e) => buildBoardRow(e)).toList(),
        bHolder: holder.item1,
        wHolder: holder.item2,
        color: activeColor);
  }

  static List<Piece> buildBoardRow(String sfenFragment) {
    // TODO: Validate sfenFragment
    List<Piece> pieceList = [];

    for (String sfenChr in sfenFragment.split('')) {
      if (StringUtil.isDigit(sfenChr)) {
        int? length = int.tryParse(sfenChr);
        pieceList.addAll(List.generate(length!, (index) => Piece.none));
      } else {
        pieceList.add(PieceVarietyMaps.getPieceFromSfenChr(sfenChr));
      }
    }

    return pieceList;
  }

  static Tuple2<List<Piece>, List<Piece>> buildPieceHolder(String sfenFragment) {
    if (sfenFragment == sfenEmptyHolder) {
      return Tuple2(List.empty(), List.empty());
    }

    List<Piece> allPieceList = [];

    for (int index = 0; index < sfenFragment.length; index++) {
      if (StringUtil.isDigit(sfenFragment[index])) {
        int? count = int.tryParse(sfenFragment[index]);
        allPieceList.addAll(List.generate(
            count! - 1, (index) => PieceVarietyMaps.getPieceFromSfenChr(sfenFragment[index + 1])));
      } else {
        allPieceList.add(PieceVarietyMaps.getPieceFromSfenChr(sfenFragment[index]));
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
