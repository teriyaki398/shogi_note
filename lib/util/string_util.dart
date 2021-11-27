class StringUtil {
  static bool isDigit(String chr) {
    return '0'.codeUnitAt(0) <= chr.codeUnitAt(0) && chr.codeUnitAt(0) <= '9'.codeUnitAt(0);
  }
}
