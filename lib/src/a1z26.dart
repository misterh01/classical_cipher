import 'utils.dart';

final Map<String, int> _a1z26Map =
    Map.fromIterables(alphabet.split(""), range(27, start: 1));
final Map<int, String> _a1z26RMap = _a1z26Map.map((k, v) => MapEntry(v, k));

/// A1Z26 cipher implementation.
///
/// [Click](github.com) for more info.
class A1Z26 {
  String separator;

  /// [separator] is a punctuation.
  A1Z26({String separator: "-"}) {
    this.separator = isPunctuation(separator) ? separator : "-";
  }

  String _convert(String text, String m) {
    StringBuffer cipher = StringBuffer();

    var list = text.split(m == "encrypt" ? "" : this.separator);

    for (var ch in list) {
      if (isLetter(ch) && m == "encrypt") {
        cipher.write(_a1z26Map[ch.toUpperCase()].toString() + this.separator);
      } else if (isDigit(ch) && m == "decrypt") {
        if (ch == "0") {
          cipher.write(" ");
        } else {
          cipher.write(_a1z26RMap[int.tryParse(ch)]);
        }
      } else {
        if (ch == " ") {
          cipher.write("0" + this.separator);
        } else {
          if (!isDigit(ch)) {
            cipher.write(m == "encrypt" ? ch + this.separator : ch);
          }
        }
      }
    }

    var cipherText = cipher.toString().trim();

    if (cipherText.endsWith(this.separator)) {
      return cipherText.substring(0, cipherText.length - 1).trim();
    } else {
      return cipherText.trim();
    }
  }

  /// Encrypt [text].
  String encrypt(String text) => _convert(text, "encrypt");

  /// Decrypt [text].
  String decrypt(String text) => _convert(text, "decrypt");
}
