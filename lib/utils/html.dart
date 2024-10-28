// Inside utils/text_utils.dart
String removeHtmlTags(String htmlText) {
  final regExp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
  return htmlText.replaceAll(regExp, '');
}
