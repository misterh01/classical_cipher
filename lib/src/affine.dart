import 'utils.dart';

/// Affine cipher implementation.
class Affine {
  int a, b;

  /// [a] and [b] are required.
  /// 
  /// [ArgumentError] if [a] is not prime with 26.
  Affine(int a, int b) {
    if (a.gcd(26) != 1) {
      throw ArgumentError("$a is not prime with 26.");
    }

    this.a = a;
    this.b = b;
  }

  String _convert(String text, String m) {
    StringBuffer cipher = StringBuffer();

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (isLetter(ch)) {
        String s;

        if (m == "encrypt") {
          s = alphabet[((this.a * alphabet.indexOf(ch.toUpperCase())) + this.b) % 26];
        } else {
          s = alphabet[(this.a.modInverse(26) * (alphabet.indexOf(ch.toUpperCase()) - this.b)) % 26];
        }

        cipher.write(isUpper(ch) ? s.toUpperCase() : s.toLowerCase());
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
