import 'utils.dart';

/// TrithemiusShift holds evolution type.
enum TrithemiusShift { ascend, descend }

/// Trithemius cipher implementation.
class Trithemius {
  int shift, _initShift;
  TrithemiusShift evolution;

  /// [e] is evolution (ascend or descend).
  /// [shift] shift number. 
  Trithemius(TrithemiusShift e, [int shift = 0]) {
    this.shift = shift;
    _initShift = shift;
    this.evolution = e;
  }

  String _convert(String text, String m) {
    this.shift = _initShift;
    StringBuffer cipher = StringBuffer();

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (isLetter(ch)) {
        String s;

        if (m == "encrypt") {
          s = alphabet[(alphabet.indexOf(ch.toUpperCase()) + shift) % 26];
        } else {
          s = alphabet[(alphabet.indexOf(ch.toUpperCase()) - shift) % 26];
        }

        cipher.write(isUpper(ch) ? s.toUpperCase() : s.toLowerCase());

        if (evolution == TrithemiusShift.ascend) {
          shift++;
        } else {
          shift--;
        }
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
