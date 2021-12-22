import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/util/piece_util.dart';

Future main() async {
  test('PieceUtil all piece is covered', () {
    Set<Piece> allPieceSet = {Piece.nil}
      ..addAll(PieceUtil.blackPieceSet)
      ..addAll(PieceUtil.whitePieceSet);

    for (var piece in Piece.values) {
      expect(allPieceSet.contains(piece), isTrue);
    }

    for (var piece in PieceUtil.blackPieceSet) {
      expect(PieceUtil.isBlackPiece(piece), isTrue);
      expect(PieceUtil.isWhitePiece(piece), isFalse);
    }

    for (var piece in PieceUtil.whitePieceSet) {
      expect(PieceUtil.isWhitePiece(piece), isTrue);
      expect(PieceUtil.isBlackPiece(piece), isFalse);
    }
  });

  test('PieceUtil.isSameColor() normal', () {
    for (var blackPiece in PieceUtil.blackPieceSet) {
      for (var blackPiece2 in PieceUtil.blackPieceSet) {
        expect(PieceUtil.isSameColor(blackPiece, blackPiece2), isTrue);
      }

      for (var whitePiece2 in PieceUtil.whitePieceSet) {
        expect(PieceUtil.isSameColor(blackPiece, whitePiece2), isFalse);
      }
    }

    for (var whitePiece in PieceUtil.whitePieceSet) {
      for (var whitePiece2 in PieceUtil.whitePieceSet) {
        expect(PieceUtil.isSameColor(whitePiece, whitePiece2), isTrue);
      }

      for (var blackPiece2 in PieceUtil.blackPieceSet) {
        expect(PieceUtil.isSameColor(whitePiece, blackPiece2), isFalse);
      }
    }
  });

  test('PieceUtil.isSameColor() error', () {
    for (var piece in Piece.values) {
      expect(() => PieceUtil.isSameColor(Piece.nil, piece), throwsA(const TypeMatcher<ArgumentError>()));
      expect(() => PieceUtil.isSameColor(piece, Piece.nil), throwsA(const TypeMatcher<ArgumentError>()));
    }
  });
}
