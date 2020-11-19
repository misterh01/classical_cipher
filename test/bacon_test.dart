import 'package:test/test.dart';

import 'package:classical_cipher/classical_cipher.dart' as cipher;

void main() {
  var bacon = cipher.Bacon();
  var table = {
    "Hold the Door": "AABBBABBBAABABBAAABB BAABBAABBBAABAA AAABBABBBAABBBABAAAB",
    "Hello World! 123.": "AABBBAABAAABABBABABBABBBA BABBAABBBABAAABABABBAAABB! 123.",
    "Lorem ipsum dolor sit amet.": "ABABBABBBABAAABAABAAABBAA ABAAAABBBBBAABABABAAABBAA AAABBABBBAABABBABBBABAAAB BAABAABAAABAABB AAAAAABBAAAABAABAABB."
  };

  var rTable = {
    "AABBBABBBAABABBAAABB BAABBAABBBAABAA AAABBABBBAABBBABAAAB": "HOLD THE DOOR",
    "AABBBAABAAABABBABABBABBBA BABBAABBBABAAABABABBAAABB! 123.": "HELLO WORLD 123",
    "ABABBABBBABAAABAABAAABBAA ABAAAABBBBBAABABABAAABBAA AAABBABBBAABABBABBBABAAAB BAABAABAAABAABB AAAAAABBAAAABAABAABB.": "LOREM IPSUM DOLOR SIT AMET"
  };

  group("Bacon", () {
    test("Encrypt", () {
      table.forEach((key, value) {
        var en = bacon.encrypt(key);
        expect(en, value);
      });
    });

    test("Decrypt", () {
      rTable.forEach((key, value) {
        var de = bacon.decrypt(key);
        expect(de, value);
      });
    });
  });
}
