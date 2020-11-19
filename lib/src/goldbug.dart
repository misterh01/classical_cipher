import 'utils.dart';

final List<String> _goldBugKey = alphabet.split("");
final List<String> _goldBugValue = "52-†81346,709*‡.\$();?¶]¢:[".split("");

final Map<String, String> _goldBugMap =
    Map.fromIterables(_goldBugKey, _goldBugValue);
final Map<String, String> _goldBugRMap =
    _goldBugMap.map((k, v) => MapEntry(v, k));

/// GoldBug cipher implementation.
/// 
/// [Click](https://en.wikipedia.org/wiki/The_Gold-Bug) for more info.
class GoldBug {
  String _convert(String text, String m) {
    StringBuffer cipher = StringBuffer();

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (ch == " ") {
        cipher.write(" ");
      } else {
        if (isLetter(ch) && m == "encrypt") {
          cipher.write(_goldBugMap[ch.toUpperCase()]);
        } else if (m == "decrypt") {
          cipher.write(_goldBugRMap[ch]);
        }
      }
    }

    return cipher.toString().trim();
  }

  /// encrypt [text].
  String encrypt(String text) => _convert(text, "encrypt");

  /// decrypt [text].
  String decrypt(String text) => _convert(text, "decrypt");
}
