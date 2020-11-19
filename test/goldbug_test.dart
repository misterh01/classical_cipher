import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var goldBug = cipher.GoldBug();
  var table = {
    "HOLD THE DOOR": "4‡0† ;48 †‡‡(",
    "Hello World! 123.": "4800‡ ]‡(0†",
    "Lorem ipsum dolor sit amet.": "0‡(89 6.)?9 †‡0‡( )6; 598;"
  };

  var rTable = {
    "4‡0† ;48 †‡‡(": "HOLD THE DOOR",
    "4800‡ ]‡(0†": "HELLO WORLD",
    "0‡(89 6.)?9 †‡0‡( )6; 598;": "LOREM IPSUM DOLOR SIT AMET"
  };

  group("GoldBug", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = goldBug.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      rTable.forEach((key, value) {
        var de = goldBug.decrypt(key);
        expect(de, value);
      });
    });
  });
}
