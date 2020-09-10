import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:dart_verifiable/signer/signer.dart';

const _NAME = "ED25518";
const _PROOF_TYPE = "Ed25519Signature2018";

class Ed25519Singer implements Signer {
  @override
  String name() {
    return _NAME;
  }

  @override
  String type() {
    return _PROOF_TYPE;
  }

  @override
  Future<Uint8List> sign(Uint8List msg, key) async {
    var privateKey = key as PrivateKey;
    final keyPair = await ed25519.newKeyPairFromSeed(privateKey);
    final signature = await ed25519.sign(
      msg,
      keyPair,
    );

    return signature.bytes;
  }

  @override
  Future<bool> verify(Uint8List msg, Uint8List signature, key) async {
    return await ed25519.verify(msg, Signature(signature, publicKey: key));
  }
}
