import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var affine = cipher.Affine(3, 5);
  var table = {
    "Hold the Door": "Avmo kar Ovve",
    "Hello World! 123.": "Armmv Tvemo! 123.",
    "Lorem ipsum dolor sit amet.": "Mverp dyhnp ovmve hdk fprk."
  };

  group("Affine", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = affine.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = affine.decrypt(value);
        expect(de, key);
      });
    });
  });
}
