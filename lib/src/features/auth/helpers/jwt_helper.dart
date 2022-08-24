class JwtHelper {
  static DateTime iatToDateTime(int iat) =>
      _addSecondsFromZeroMillisecondsSinceEpoch(iat);

  static DateTime expToDateTime(int exp) =>
      _addSecondsFromZeroMillisecondsSinceEpoch(exp);

  static DateTime _addSecondsFromZeroMillisecondsSinceEpoch(int seconds) =>
      DateTime.fromMillisecondsSinceEpoch(0).add(Duration(seconds: seconds));
}
