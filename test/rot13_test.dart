import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var rot13 = cipher.Rot13();
  var table = {
    "Hold the Door": "Ubyq gur Qbbe",
    "Hello World! 123.": "Uryyb Jbeyq! 123.",
    "Lorem ipsum dolor sit amet.": "Yberz vcfhz qbybe fvg nzrg."
  };

  group("ROT13", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = rot13.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = rot13.decrypt(value);
        expect(de, key);
      });
    });
  });
}
