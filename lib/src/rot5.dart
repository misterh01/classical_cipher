import 'utils.dart';

/// Rot5 cipher implementation.
class Rot5 {
  String _convert(String text, int add) {
    StringBuffer cipher = StringBuffer();

    for (var i = 0; i < text.length; i++) {
      var char = text[i];

      if (isDigit(char)) {
        cipher.write(((int.parse(char) + add) % 10).toString());
      } else {
        cipher.write(char);
      }
    }

    return cipher.toString();
  }

  /// Encrypt [text].
  String encrypt(String text) {
    return _convert(text, 5);
  }

  /// Decrypt [text].
  String decrypt(String text) {
    return _convert(text, -5);
  }
}
