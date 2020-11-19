import 'utils.dart';

final List<String> _baconValue = [
  "AAAAA",
  "AAAAB",
  "AAABA",
  "AAABB",
  "AABAA",
  "AABAB",
  "AABBA",
  "AABBB",
  "ABAAA",
  "ABAAB",
  "ABABA",
  "ABABB",
  "ABBAA",
  "ABBAB",
  "ABBBA",
  "ABBBB",
  "BAAAA",
  "BAAAB",
  "BAABA",
  "BAABB",
  "BABAA",
  "BABAB",
  "BABBA",
  "BABBB",
  "BBAAA",
  "BBAAB"
];
final Map<String, String> _baconMap =
    Map.fromIterables(alphabet.split(""), _baconValue);
final Map<String, String> _baconRMap =
    _baconMap.map((key, value) => MapEntry(value, key));

/// Bacon cipher implementation.
///
/// [Click](https://en.wikipedia.org/wiki/Bacon%27s_cipher) for more info.
class Bacon {
  String _convert(String text, String m) {
    StringBuffer cipher = StringBuffer();
    var list = m == "encrypt"
        ? text.split("")
        : text.replaceAll(RegExp(r"[^\w\s]|[0-9]/g"), "").split(" ");

    for (var ch in list) {
      if (isLetter(ch) && m == "encrypt") {
        cipher.write(_baconMap[ch.toUpperCase()]);
      } else if (isLetter(ch) && m == "decrypt") {
        for (var i in range(ch.length ~/ 5)) {
          cipher.write(_baconRMap[ch.substring(i * 5, (i + 1) * 5)]);
        }
      } else {
        cipher.write(ch);
      }

      if (m == "decrypt") cipher.write(" ");
    }

    return cipher.toString().trim();
  }

  /// Encrypt [text].
  String encrypt(String text) => _convert(text, "encrypt");

  /// Decrypt [text].
  String decrypt(String text) => _convert(text, "decrypt");
}
