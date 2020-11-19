import 'utils.dart';

/// Atbash cipher implementation.
///
/// [Click](https://en.wikipedia.org/wiki/Atbash) for more info.
class Atbash {
  int _azU = 155;
  int _azL = 219;

  String _convert(String text) {
    StringBuffer cipher = StringBuffer();

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (isLetter(ch)) {
        cipher.write(String.fromCharCode((isUpper(ch) ? _azU : _azL) - ch.codeUnitAt(0)));
      } else {
        cipher.write(ch);
      }
    }

    return cipher.toString();
  }

  /// Encrypt [text].
  String encrypt(String text) => _convert(text);

  /// Decrypt [text].
  String decrypt(String text) => _convert(text);
}
