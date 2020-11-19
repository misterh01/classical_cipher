import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var rot47 = cipher.Rot47();
  var table = {
    "Hold the Door": "w@=5 E96 s@@C",
    "Hello World! 123.": "w6==@ (@C=5P `ab]",
    "Lorem ipsum dolor sit amet.": "{@C6> :ADF> 5@=@C D:E 2>6E]"
  };

  group("ROT47", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = rot47.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = rot47.decrypt(value);
        expect(de, key);
      });
    });
  });
}
