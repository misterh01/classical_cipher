import 'utils.dart';

/// Vigenere cipher implementation.
class Vigenere {
  String key;

  /// [key] keyword for cipher.
  Vigenere(this.key);

  String _convert(String text, String m) {
    StringBuffer cipher = StringBuffer();
    int keyIndex = 0;
    String keyUpper = this.key.toUpperCase();

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (isLetter(ch)) {
        int alphaIndex = alphabet.indexOf(ch.toUpperCase());

        if (m == "encrypt") {
          alphaIndex += alphabet.indexOf(keyUpper[keyIndex]);
        } else {
          alphaIndex -= alphabet.indexOf(keyUpper[keyIndex]);
        }

        alphaIndex %= 26;

        String s = alphabet[alphaIndex];
        cipher.write(isUpper(ch) ? s : s.toLowerCase());

        keyIndex++;
        if (keyIndex == keyUpper.length) keyIndex = 0;
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
