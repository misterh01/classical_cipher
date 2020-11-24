import 'utils.dart';

/// Gronsfled cipher implementation.
class Gronsfeld {
  String key;

  /// [key] should only include digits.
  /// 
  /// [ArgumentError] if key is not all number.
  Gronsfeld(String key) {
    if (!isDigit(key)) {
      throw ArgumentError("$key should only include digits.");
    }

    this.key = key;
  }

  String _convert(String text, String m) {
    StringBuffer cipher = StringBuffer();
    int keyIndex = 0;

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (isLetter(ch)) {
        String s;

        int chIndex = alphabet.indexOf(ch.toUpperCase());
        int keyIntIndex = int.tryParse(this.key[keyIndex]);
        if (m == "encrypt") {
          s = alphabet[(chIndex + keyIntIndex) % 26];
        } else {
          s = alphabet[(chIndex - keyIntIndex) % 26];
        }

        cipher.write(isUpper(ch) ? s : s.toLowerCase());

        keyIndex++;
        if (keyIndex == this.key.length) keyIndex = 0;
      } else {
        cipher.write(ch);
      }
    }

    return cipher.toString();
  }

  /// Encrypt [text].
  String encrypt(String text) => _convert(text, "encrypt");

  /// Decrypt [text].
  String decrypt(String text) => _convert(text, "decrypt");
}
