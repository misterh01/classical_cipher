import 'caesar.dart';

Caesar _caesar = Caesar(13);

/// Rot13 cipher implementation.
/// 
/// [Click](https://en.wikipedia.org/wiki/ROT13) for more info.
class Rot13 {

  /// Encrypt [text].
  String encrypt(String text) {
    return _caesar.encrypt(text);
  }

  /// Decrypt [text].
  String decrypt(String text) {
    return _caesar.decrypt(text);
  }
}
