import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var gronsfeld = cipher.Gronsfeld("123");
  var table = {
    "Hold the Door": "Iqoe vkf Frpt",
    "Hello World! 123.": "Igomq Zptoe! 123.",
    "Lorem ipsum dolor sit amet.": "Mqufo lquxn frmqu tkw bohu."
  };

  group("Gronsfeld", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = gronsfeld.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = gronsfeld.decrypt(value);
        expect(de, key);
      });
    });
  });
}
