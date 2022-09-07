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
}
