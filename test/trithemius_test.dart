import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var trithemius = cipher.Trithemius(cipher.TrithemiusShift.ascend);
  var trithemius2 = cipher.Trithemius(cipher.TrithemiusShift.descend, 4);
  var table = {
    "Hold the Door": "Hpng xmk Kwxb",
    "Hello World! 123.": "Hfnos Buytm! 123.",
    "Lorem ipsum dolor sit amet.": "Lpthq nvzcv nzxbf hyk sfyo."
  };

  var table2 = {
    "Hold the Door": "Lrne tgc Akjl",
    "Hello World! 123.": "Lhnmo Vmohy! 123.",
    "Lorem ipsum dolor sit amet.": "Prtfm hnpqh xhdfh hwg mxoc."
  };

  group("trithemius", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = trithemius.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = trithemius.decrypt(value);
        expect(de, key);
      });
    });
  });

  group("trithemius table 2", () {
    test("Encrypt", () {
      table2.forEach((key, value) {
        var en = trithemius2.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table2.forEach((key, value) {
        var de = trithemius2.decrypt(value);
        expect(de, key);
      });
    });
  });
}
