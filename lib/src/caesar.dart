/// Caesar cipher implementation.
/// 
/// [Click](https://en.wikipedia.org/wiki/Caesar_cipher) for more info.
class Caesar {
  int shift;

  /// [shift] is greater than 0 and greater than or eqaul to 26.
  Caesar(int shift) {
    this.shift = (shift <= 0 || shift > 26) ? 1 : shift;
  }

  String _convert(String text, int key) {
    StringBuffer cipher = new StringBuffer();

    for (int i = 0; i < text.length; i++) {
      int code = text.codeUnitAt(i);

      if (code >= "A".codeUnitAt(0) && code <= "Z".codeUnitAt(0)) {
        int aCode = "A".codeUnitAt(0);
        String t = String.fromCharCode(aCode + (code - aCode + key) % 26);
        cipher.write(t);
      } else if (code >= "a".codeUnitAt(0) && code <= "z".codeUnitAt(0)) {
        int aCode = "a".codeUnitAt(0);
        String t = String.fromCharCode(aCode + (code - aCode + key) % 26);
        cipher.write(t);
      } else {
        cipher.write(text[i]);
      }
    }

    return cipher.toString();
  }

  /// Encrypt [text].
  String encrypt(String text) {
    return _convert(text, this.shift);
  }

  /// Decrypt [text].
  String decrypt(String text) {
    return _convert(text, 26-shift);
  }
}
