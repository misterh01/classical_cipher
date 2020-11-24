import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var vigenere = cipher.Vigenere("hello");
  var table = {
    "Hold the Door": "Oswo hoi Ozcy",
    "Hello World! 123.": "Oiwwc Dscwr! 123.",
    "Lorem ipsum dolor sit amet.": "Sscpa ptdfa kswzf zme lalx."
  };

  group("Vigenere", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = vigenere.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = vigenere.decrypt(value);
        expect(de, key);
      });
    });
  });
}
