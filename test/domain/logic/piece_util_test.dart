import 'package:flutter_test/flutter_test.dart';
import 'package:shogi_note/domain/const/piece.dart';
import 'package:shogi_note/domain/const/piece_attributes.dart';

void main() {
  test('PieceAttributes all piece is covered', () {
    Set<Piece> allPieceSet = {Piece.nil}
      ..addAll(PieceAttributes.blackPieceSet)
      ..addAll(PieceAttributes.whitePieceSet);

    for (var piece in Piece.values) {
      expect(allPieceSet.contains(piece), isTrue);
    }

    for (var piece in PieceAttributes.blackPieceSet) {
      expect(PieceAttributes.isBlackPiece(piece), isTrue);
      expect(PieceAttributes.isWhitePiece(piece), isFalse);
    }

    for (var piece in PieceAttributes.whitePieceSet) {
      expect(PieceAttributes.isWhitePiece(piece), isTrue);
      expect(PieceAttributes.isBlackPiece(piece), isFalse);
    }
  });

  test('PieceAttributes.isSameColor() normal', () {
    for (var blackPiece in PieceAttributes.blackPieceSet) {
      for (var blackPiece2 in PieceAttributes.blackPieceSet) {
        expect(PieceAttributes.isSameColor(blackPiece, blackPiece2), isTrue);
      }

      for (var whitePiece2 in PieceAttributes.whitePieceSet) {
        expect(PieceAttributes.isSameColor(blackPiece, whitePiece2), isFalse);
      }
    }

    for (var whitePiece in PieceAttributes.whitePieceSet) {
      for (var whitePiece2 in PieceAttributes.whitePieceSet) {
        expect(PieceAttributes.isSameColor(whitePiece, whitePiece2), isTrue);
      }

      for (var blackPiece2 in PieceAttributes.blackPieceSet) {
        expect(PieceAttributes.isSameColor(whitePiece, blackPiece2), isFalse);
      }
    }
  });
}
