import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var atbash = cipher.Atbash();
  var table = {
    "Hold the Door": "Slow gsv Wlli",
    "Hello World! 123.": "Svool Dliow! 123.",
    "Lorem ipsum dolor sit amet.": "Olivn rkhfn wloli hrg znvg."
  };

  group("Atbash", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = atbash.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = atbash.decrypt(value);
        expect(de, key);
      });
    });
  });
}
