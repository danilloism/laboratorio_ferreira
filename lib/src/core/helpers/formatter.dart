class Formatter {
  const Formatter._();

  static String? fromErrorList(List<String?> errors) {
    final listWithoutNull = errors.whereType<String>();

    if (listWithoutNull.isEmpty) return null;

    final finalString = listWithoutNull.reduce((value, element) {
      if (value.isEmpty) {
        if (element.isEmpty) return '';
        return element;
      }
      return element.isEmpty ? value : '$value\n$element';
    }).trim();

    return finalString.isNotEmpty ? finalString : null;
  }

  static String applyPhoneMask(String raw) {
    assert(raw.length == 11);
    final ddd = raw.substring(0, 2);
    final numero = raw.substring(2);
    final primeiraParte = numero.substring(0, 5);
    final ultimaParte = numero.substring(5);

    return '($ddd) $primeiraParte-$ultimaParte';
  }

  static String unmaskPhone(String phone) =>
      phone.replaceAll(RegExp('[^0-9]'), '');
}
