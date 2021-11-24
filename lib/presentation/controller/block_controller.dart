import 'package:flutter/foundation.dart';

class BlockController with ChangeNotifier {
  String comment = "Hello world";

  void update(String comment) {
    this.comment = comment;
    notifyListeners();
  }
}
