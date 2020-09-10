import 'dart:typed_data';

abstract class Signer {
  Future<Uint8List> sign(Uint8List msg, key);
  Future<bool> verify(Uint8List msg, Uint8List signature, key);
  String name();
  String type();
}
