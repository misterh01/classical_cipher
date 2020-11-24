# Classical Cipher
Encrypt and Decrypt string using classical ciphers.

## Example
> Using Affine cipher.

```dart
import 'package:classical_cipher/classical_cipher.dart';

void main() {
  var affine = Affine(3, 5);
  String encrypt = affine.encrypt("Hello World!");
  String decrypt = affine.decrypt(encrypt);

  print(encrypt); // Armmv Tvemo!
  print(decrypt); // Hello World!
}
```