import 'dart:convert';
import 'dart:typed_data';

Uint8List convertVarbinaryStringToByteArray(String hexString) {
hexString = hexString.replaceAll(RegExp(r'[^0-9A-Fa-f]'), ''); // Strip non-hex characters
  if (hexString.length % 2 != 0) {
    throw const FormatException("Invalid hex string length");
  }
  return Uint8List.fromList(List.generate(
    hexString.length ~/ 2,
    (index) => int.parse(hexString.substring(index * 2, index * 2 + 2), radix: 16),
  ));
}

Uint8List convertBase64ToByteArray(String base64String) {
  return base64Decode(base64String);
}

getunit8list(String varbinaryString) {
  Uint8List byteArray;
try {
  // Try decoding as hexadecimal
  byteArray = convertBase64ToByteArray(varbinaryString);
} catch (e) {
  // If hex fails, assume Base64 and try that
  byteArray = convertVarbinaryStringToByteArray(varbinaryString);
}
return byteArray;
}