class Formatter {
  const Formatter._();

  static String? fromErrorList(List<String?> errors) {
    return errors.reduce((value, element) {
      if (value == null || value.isEmpty) {
        if (element == null || element.isEmpty) return null;
        return element;
      }
      return element == null || element.isEmpty ? value : '$value\n$element';
    })?.trim();
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
