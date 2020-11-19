import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var rot18 = cipher.Rot18();
  var table = {
    "Hold the Door": "Ubyq gur Qbbe",
    "Hello World! 123.": "Uryyb Jbeyq! 678.",
    "Lorem ipsum dolor sit amet.": "Yberz vcfhz qbybe fvg nzrg."
  };

  group("Rot18", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = rot18.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = rot18.decrypt(value);
        expect(de, key);
      });
    });
  });
}
