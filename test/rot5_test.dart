import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var rot5 = cipher.Rot5();
  var table = {
    "1234567890": "6789012345",
    "Hello World! 123.": "Hello World! 678.",
    "Lorem ipsum dolor sit amet.": "Lorem ipsum dolor sit amet."
  };

  group("Rot5", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = rot5.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = rot5.decrypt(value);
        expect(de, key);
      });
    });
  });
}
