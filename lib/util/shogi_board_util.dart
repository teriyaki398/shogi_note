import 'package:shogi_note/domain/const/active_color.dart';
import 'package:shogi_note/domain/model/board_state.dart';

class ShogiBoardUtil {
  static const String sfenSeparator = ' ';
  static const String sfenSubSeparator = '/';

  static BoardState buildBoardState(String sfen) {
    List<String> sfenSnippets = sfen.split(sfenSeparator);

    String sfenPieceOnBoard = sfenSnippets[0];
    String sfenActiveColor = sfenSnippets[1];
    String sfenBHolder = sfenSnippets[2];
    String sfenWHolder = sfenSnippets[3];

    return BoardState(pieceOnBoard: [[]], bHolder: [], wHolder: [], color: ActiveColor.black);
  }
}
