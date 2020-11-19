import 'utils.dart';
import 'rot13.dart';
import 'rot5.dart';

Rot13 _rot13 = Rot13();
Rot5 _rot5 = Rot5();

/// Rot18 cipher implementation.
class Rot18 {
  String _convert(String text, String m) {
    StringBuffer cipher = StringBuffer();

    for (var i = 0; i < text.length; i++) {
      var ch = text[i];

      if (isLetter(ch)) {
        cipher.write(m == "encrypt" ? _rot13.encrypt(ch) : _rot13.decrypt(ch));
      } else if (isDigit(ch)) {
        cipher.write(m == "encrypt" ? _rot5.encrypt(ch) : _rot5.decrypt(ch));
      } else {
        cipher.write(ch);
      }
    }

    return cipher.toString();
  }

  /// Encrypt [text].
  String encrypt(String text) {
    return _convert(text, "encrypt");
  }

  /// Decrypt [text].
  String decrypt(String text) {
    return _convert(text, "decrypt");
  }
}
