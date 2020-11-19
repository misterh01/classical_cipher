import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var a1z26 = cipher.A1Z26();
  
  var table = {
    "Hold the Door": "8-15-12-4-0-20-8-5-0-4-15-15-18",
    "Hello World! 123.": "8-5-12-12-15-0-23-15-18-12-4-!-0-.",
    "Lorem ipsum dolor sit amet.": "12-15-18-5-13-0-9-16-19-21-13-0-4-15-12-15-18-0-19-9-20-0-1-13-5-20-."
  };

  var rTable = {
    "8-15-12-4-0-20-8-5-0-4-15-15-18": "HOLD THE DOOR",
    "8-5-12-12-15-0-23-15-18-12-4-!-0-.": "HELLO WORLD! .",
    "12-15-18-5-13-0-9-16-19-21-13-0-4-15-12-15-18-0-19-9-20-0-1-13-5-20-.": "LOREM IPSUM DOLOR SIT AMET."
  };

  group("A1Z26", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = a1z26.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      rTable.forEach((key, value) {
        var de = a1z26.decrypt(key);
        expect(de, value);
      });
    });
  });
}
