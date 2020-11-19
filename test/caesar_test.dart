import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var caesar = cipher.Caesar(5);
  
  var table = {
    "Lorem ipsum dolor sit amet.": "Qtwjr nuxzr itqtw xny frjy.",
    "Maecenas at magna et nisl pharetra facilisis in at ligula.":
        "Rfjhjsfx fy rflsf jy snxq umfwjywf kfhnqnxnx ns fy qnlzqf.",
    "Hold the Door": "Mtqi ymj Ittw",
    "Hello World 123 @% ^ 0 kd": "Mjqqt Btwqi 123 @% ^ 0 pi"
  };

  group("Caesar", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = caesar.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      table.forEach((key, value) {
        var de = caesar.decrypt(value);
        expect(de, key);
      });
    });
  });
}
