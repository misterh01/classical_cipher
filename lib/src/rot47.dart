/// Rot47 cipher implementation.
class Rot47 {
  String _convert(String text) {
    StringBuffer cipher = StringBuffer();

    for (var i = 0; i < text.length; i++) {
      int c = text[i].codeUnitAt(0);

      if (c >= 33 && c <= 126) {
        cipher.write(String.fromCharCode(33 + ((c + 14) % 94)));
      } else {
        cipher.write(text[i]);
      }
    }

    return cipher.toString();
  }

  /// Encrypt [text]
  String encrypt(String text) {
    return _convert(text);
  }

  /// Decrypt [text]
  String decrypt(String text) {
    return _convert(text);
  }
}
